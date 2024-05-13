import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:astro_guide_astro/cache_manager/CacheManager.dart';
import 'package:astro_guide_astro/notifier/GlobalNotifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/MeetingConstants.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/controllers/call/CallController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/repositories/MeetingRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';

class NotificationHelper {
  // FCM Messaging
  static late FirebaseMessaging messaging;
  static bool? init;

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  static final GlobalNotifier globalNotifier = Get.find();
  static final storage = GetStorage();
  static late IO.Socket socket;

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      await Firebase.initializeApp();

      messaging = FirebaseMessaging.instance;
      init = true;

      await initNotification();
      await setupFcmNotificationSettings();
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
      listenToActionButtons();
    } catch (error) {
      print("error.toString()");
      print(error.toString());
    }
  }

  static initializeSocket() async {
    print("initialize socket noti");
    socket = IO.io(
      ApiConstants.urlS,
      IO.OptionBuilder()
          .setTransports(['websocket']).setQuery(
          {
            "username" : storage.read("access"),
            "id" : storage.read("fcm"),
            "sender" : "A",
          }).build(),
    );
    connectSocket();
  }

  static void connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.on('notifier', (data) async {
        print("socket notifier");
        print(data);
      },
    );
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // Only after at least the action method is set, the notification events are delivered
    awesomeNotifications.setListeners(
      onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );
  }


  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  static Future<String> generateFcmToken() async {
    if(init!=true) {
      await initFcm();
    }
    try {
      String? token = storage.read("fcm")??(await messaging.getToken());
      storage.write("fcm", token);
      return token??"";
    } catch (error) {
      print(error.toString());
    }

    return "";
  }

  ///handle fcm notification when app is closed/terminated
  /// if you are wondering about this annotation read the following
  /// https://stackoverflow.com/a/67083337
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    final storage = GetStorage();
    print("categoryyyyy backk");
    print(message);
    print(message.data);
    String category = message.data['category'].toString().toLowerCase();
    print(category);
    print(message.data['title']);
    Directory directory = await getApplicationDocumentsDirectory();

    if(storage.read("status") == "logged in") {
      // if(category=="call" || category=="chat") {
      //   showIncomingCall(message.data);
      // }
      // else {
      var random = Random();
      _showNotification(
          id: random.nextInt(pow(2, 31).toInt() - 1),
          title: message.notification?.title ?? message?.data['title'] ?? '',
          body: message.notification?.body ?? message?.data['body'] ?? '',
          payload: message.data.cast(),
          notificationLayout: NotificationLayout.BigText,
          category: category == "call" ||
              category == "chat"
              ? NotificationCategory.Call
              : category == "cancelled" ? NotificationCategory
              .MissedCall : null
      );
      // }

      if (category == "rejected" || category == "ended" ||
          category == "missed" || category == "cancelled") {
        print("storage.read(calling) cancelled");

        String status = category == "rejected" ? "REJECTED" : category ==
            "missed" ? "MISSED" : category == "cancelled"
            ? "CANCELLED"
            : "COMPLETED";

        if (globalNotifier.callController.value != null) {
          print("sswebnoti: calling callllllll");
          CallController callController = globalNotifier.callController.value!;
          callController.endMeeting(
              "background notification 255", status, back: true,
              path: directory.path);
          globalNotifier.updateCallController(null);
        }
        else {
          globalNotifier.updateCallingStatus(status);
          print("sswebnoti filee: calling_status ${globalNotifier.callingStatus
              .value}");


          CallController callController = globalNotifier.callController.value!;
          callController.endMeeting(
              "background notification 267", status, back: true,
              path: directory.path);
          // socketMeeting(message.data['ch_id'], status);
        }
      }
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    final storage = GetStorage();
    print("categoryyyyy");
    print(message);
    print(message.data);
    String category = message.data['category'].toString().toLowerCase();
    print(category);
    print(category=="call");
    bool go = true;
    Directory directory = await getApplicationDocumentsDirectory();

    if(storage.read("status") == "logged in") {
      if (category == "chat" || category == "call") {
        go = false;
        session(message.data);
      }

      if (go) {
        globalNotifier.updateValue("session");
        // if(category=="cancelled") {
        print("inner goooo");
        print(category == "cancelled");
        if (category == "waitlist" || category == "cancelled") {
          print("sswebnoti: storage.read calling cancelled");
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;
            if (callController.user.id == int.parse(message.data['user_id'])) {
              callController.back();
              globalNotifier.updateCallController(null);
            }
            else {
              globalNotifier.updateCallingStatus("back");
              // socketMeeting(message.data['ch_id'], "");
            }
          }
          else {
            CallController callController = Get.put<CallController>(
                CallController());
            callController.endMeeting(
                "foreground notification 385", "CANCELLED",
                path: directory.path);
          }
        }

        // else if(category=="cancelled") {
        //   final storage = GetStorage();
        //
        //   print(globalNotifier.callController.value);
        //   if(globalNotifier.callController.value!=null) {
        //     CallController callController = globalNotifier.callController.value;
        //     callController.back();
        //     storage.remove("calling");
        //   }
        // }

        // else if(category=="rejected" || category=="ended") {
        //   final storage = GetStorage();
        //
        //   print(globalNotifier.callController.value);
        //   if(globalNotifier.callController.value!=null) {
        //     CallController callController = globalNotifier.callController.value;
        //     callController.endMeeting(category=="rejected" ? "REJECTED" : "COMPLETED");
        //     storage.remove("calling");
        //   }
        // }
        else if (category == "cancelled") {
          final storage = GetStorage();

          print("storage.read calling cancelled");
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;
            callController.back();
            globalNotifier.updateCallController(null);
          }
          else {
            final storage = GetStorage();

            globalNotifier.updateCallingStatus("back");
            // socketMeeting(message.data['ch_id'], "");
          }
        }

        else if (category == "rejected" || category == "ended" ||
            category == "missed") {
          final storage = GetStorage();

          String status = category == "rejected" ? "REJECTED" : category ==
              "missed" ? "MISSED" : "COMPLETED";
          if (globalNotifier.callController.value != null) {
            CallController callController = globalNotifier.callController
                .value!;
            callController.endMeeting(
                "foreground notification 436", status, path: directory.path);
            globalNotifier.updateCallController(null);
          }
          else {
            globalNotifier.updateCallingStatus(status);
            CallController callController = Get.put<CallController>(
                CallController());
            callController.endMeeting(
                "foreground notification 444", status, path: directory.path);
            // socketMeeting(message.data['ch_id'], status);
          }
        }

        // else if(category=="ended") {
        //   final storage = GetStorage();
        //
        //   print(globalNotifier.callController.value);
        //   if(globalNotifier.callController.value!=null) {
        //     CallController callController = globalNotifier.callController.value;
        //     callController.endMeeting("COMPLETED");
        //     storage.remove("calling");
        //   }
        // }

        var random = Random();
        _showNotification(
            id: random.nextInt(pow(2, 31).toInt() - 1),
            title: message.notification?.title ?? message?.data['title'] ?? '',
            body: message.notification?.body ?? message?.data['body'] ?? '',
            payload: message.data.cast(),
            // pass payload to the notification card so you can use it (when user click on notification)
            notificationLayout: NotificationLayout.BigText,
            category: category == "call" ||
                category == "chat"
                ? NotificationCategory.Call
                : category == "cancelled" || category == "waitlist"
                ? NotificationCategory.MissedCall
                : null
        );
      }
    }
  }

  //display notification for user with sound
  static _showNotification(
      {required String title,
        required String body,
        required int id,
        String? channelKey,
        String? groupKey,
        NotificationLayout? notificationLayout,
        NotificationCategory? category,
        String? summary,
        Map<String, String>? payload,
        String? largeIcon}) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        awesomeNotifications.requestPermissionToSendNotifications();
      } else {
        // u can show notification
        if(body.isEmpty&&title.isEmpty) {

        }
        else {
          print("notification createddddd");
          awesomeNotifications.createNotification(
              content: NotificationContent(
                id: id,
                title: title,
                body: body,
                category: category,
                groupKey: groupKey ?? NotificationChannels.generalGroupKey,
                channelKey: channelKey ?? NotificationChannels.generalChannelKey,
                showWhen: true,
                // Hide/show the time elapsed since notification was displayed
                payload: payload,
                // data of the notification (it will be used when user clicks on notification)
                // notificationLayout: NotificationLayout.BigPicture, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
                notificationLayout: notificationLayout ??
                    NotificationLayout.Default,
                // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
                autoDismissible: true,
                // dismiss notification when user clicks on it
                summary: summary,
                timeoutAfter: category==NotificationCategory.Call ? Duration.zero : Duration(seconds: 5),
                // for ex: New message (it will be shown on status bar before notificaiton shows up)
                largeIcon: largeIcon,
                // image of sender for ex (when someone send you message his image will be shown)
                fullScreenIntent: true,
                wakeUpScreen: true,
                locked: category==NotificationCategory.Call ? true : false,

                // customSound: 'resource://raw/res_notification',
                // customSound: 'asset://assets/audio/notification'
              ),
              actionButtons: category == NotificationCategory.Call ?
              [
                NotificationActionButton(key: "ACCEPT",
                    label: "ACCEPT",
                    color: MyColors.colorSuccess,
                    autoDismissible: true),
                NotificationActionButton(key: "REJECT",
                    label: "REJECT",
                    color: MyColors.colorError,
                    autoDismissible: true,
                    actionType: ActionType.DismissAction),
              ] : null,
          );
        }
      }
    });

  }

  ///init notifications channels
  static initNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    //   print('User granted provisional permission');
    // } else {
    //   print('User declined or has not accepted permission');
    // }
    await awesomeNotifications.initialize(
        null, // null mean it will show app icon on the notification (status bar)
        [
          NotificationChannel(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            channelDescription: 'Notification channel for general notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            soundSource: 'resource://raw/notinoti',
            // soundSource: 'asset://assets/audio/notification',
          ),
        ],

        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelGroupName: NotificationChannels.generalChannelGroupName,
          ),
        ]
    );
  }

  static Future<void> rejectCall(String meetingID, String sessionID, String token, String meet_id) async {
    final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;

    final storage = GetStorage();

    Map<String, String> data = {
      MeetingConstants.meetingID: meetingID,
      MeetingConstants.sessionID: sessionID,
      MeetingConstants.token: token,
      MeetingConstants.meet_id: meet_id.toString(),
      MeetingConstants.status: "REJECTED",
    };
    print(data);



    await meetingProvider.end(data, storage.read("access")).then((
        response) async {
      print(response.toJson());
      if (response.code == 1) {}
      else if (response.code == -2) {}
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  static Future<void> rejectChat(String ch_id) async {
    print("CHAT REJECTED $ch_id");
    // final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
    // final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;
    //
    // final storage = GetStorage();
    //
    // Map<String, String> data = {
    //   MeetingConstants.meetingID: meetingID,
    //   MeetingConstants.sessionID: sessionID,
    //   MeetingConstants.token: token,
    //   MeetingConstants.meet_id: meet_id.toString(),
    //   MeetingConstants.status: "REJECTED",
    // };
    // print(data);
    //
    //
    //
    // await meetingProvider.end(data, storage.read("access")).then((
    //     response) async {
    //   print(response.toJson());
    //   if (response.code == 1) {}
    //   else if (response.code == -2) {}
    //   else {
    //     Essential.showSnackBar(response.message);
    //   }
    // });
  }

  // static void session(RemoteMessage message) {
  static void session(Map<String, dynamic> data) {
    print("message.data['wallet']");
    print(data['wallet']);
    print(data);
    Map<String, dynamic> arguments= {
      "user": UserModel(
          id: int.parse(data['user_id'] ?? "-1"),
          name: data['name'] ?? "",
          profile: data['profile'] ?? "",
          mobile: ''
      ),
      "ch_id": int.parse(data['ch_id'] ?? "-1"),
      "type": "REQUESTED",
      "action" : "NOT DECIDED",
      "wallet": double.parse(data['wallet'] ?? "0"),
    };

    if(data['category'].toString().toLowerCase()=="call") {
      arguments.addAll(
          {
            "session_history" : SessionHistoryModel.fromJson(json.decode(data['session_history'])),
            "meetingID": data['meetingID'] ?? "-1",
            "sessionID": data['sessionID'] ?? "-1",
          }
      );
    }

    print("sswebnotifier: before notification ${globalNotifier.showSession}");
    globalNotifier.updateValue("notification");
    print("sswebnotifier: after notification ${globalNotifier.showSession}");


    print("session from notification start");
    print(arguments);
    print(data['path'] ?? "/splash");
    print("session from notification end");

    Get.toNamed(
        data['path'] ?? "/splash",
        arguments: arguments
    );
  }
}

class NotificationChannels {
  // chat channel (for messages only)
  // static String get chatChannelKey => "chat_channel";
  // static String get chatChannelName => "Chat channel";
  // static String get chatGroupKey => "chat group key";
  // static String get chatChannelGroupKey => "chat_channel_group";
  // static String get chatChannelGroupName => "Chat notifications channels";
  // static String get chatChannelDescription => "Chat notifications channels";

  // general channel (for all other notifications)
  static String get generalChannelKey => "basic_channel";
  static String get generalGroupKey => "basic group key";
  static String get generalChannelGroupKey => "basic_channel_group";
  static String get generalChannelGroupName => "Basic group";
  static String get generalChannelName => "Basic notifications";
  static String get generalChannelDescription => "Notification channel for messages";
}

Future<void> rejectCall(String ch_id) async {
  final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
  final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;

  final GlobalNotifier globalNotifier = Get.find();

  Map <String, dynamic> data = {
    SessionConstants.ch_id : ch_id,
    SessionConstants.sender : "A",
    SessionConstants.reason : "Chat was rejected by astrologer",
  };

  if(globalNotifier.callController.value!=null) {
    globalNotifier.updateCallController(null);
  }

  await meetingProvider.reject(data, storage.read("access")).then((response) async {
    if(response.code==1) {
    }
    else if(response.code!=-1) {
    }
    else {
    }
  });
}

Future<void> rejectChat(String ch_id, String user_id) async {

  final storage = GetStorage();
  IO.Socket socket =  IO.io(
    ApiConstants.urlS,
    IO.OptionBuilder().setTransports(['websocket']).setQuery(
        {
          SessionConstants.username : storage.read("access"),
          SessionConstants.ch_id : ch_id,
          SessionConstants.sender : "A",
          SessionConstants.user_id : user_id,
        }).build(),
  );
  socket.onConnect((data) => print('Connection established'));
  socket.onConnectError((data) => print('Connect Error: $data'));
  socket.onDisconnect((data) => print('Socket.IO server disconnected'));
  Map <String, dynamic> data = {
    SessionConstants.username : storage.read("access"),
    SessionConstants.ch_id : ch_id,
    SessionConstants.sender : "A",
    SessionConstants.reason : "Chat was rejected by astrologer",
  };


  socket.emit('reject', data);
}

// Future<void> socketMeeting(String ch_id, String status) async {
//   print("socketttt Meetingggg");
//   final storage = GetStorage();
//   print(storage.getKeys());
//   IO.Socket socket =  IO.io(
//     ApiConstants.urlES,
//     IO.OptionBuilder().setTransports(['websocket']).setQuery(
//         {
//           // SessionConstants.username : storage.read("access"),
//           "meet_id" : ch_id,
//           SessionConstants.sender : "A",
//         }).build(),
//   );
//   socket.onConnect((data) => print('Connection established'));
//   socket.onConnectError((data) => print('Connect Error: $data'));
//   socket.onDisconnect((data) => print('Socket.IO server disconnected'));
//
//   socket.on(
//       'endMeeting', (data) async {
//     EndCallResponseModel endCallResponse = EndCallResponseModel.fromJson(json.decode(data));
//
//
//     print("socketttt Meetingggg end responseeeeeeeee notiii");
//
//     // endMeeting(endCallResponse.category??"");
//   }
//   );
//
//   socket.on(
//       'backMeeting', (data) async {
//     ResponseModel response = ResponseModel.fromJson(json.decode(data));
//
//     print("socketttt Meetingggg back responseeeeeeeee notiii");
//     print(response.toJson());
//     // back();
//
//
//   }
//   );
//   Map <String, dynamic> data = {
//     // SessionConstants.username : storage.read("access"),
//     SessionConstants.sender : "A",
//     "meet_id" : ch_id,
//   };
//
//   print(data);
//   if(status.isNotEmpty) {
//     print("end status");
//     data.addAll({"status" : status});
//     socket.emit('endMeeting', data);
//   }
//   else {
//     print("back status");
//     socket.emit('backMeeting', data);
//   }
//   // socket.close();
//   // socket.dispose();
//   // Get.offAllNamed('/splash');
// }

class NotificationController {


  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    print("createdddddd");
    print(receivedNotification);
    print(receivedNotification.payload);

    if(receivedNotification.category!=NotificationCategory.Call) {
      print("last call id ${storage.read("current_id")}");
      if(storage.read("current_id")!=null) {
        AwesomeNotifications().cancel(storage.read("current_id"));
        storage.remove("current_id");
      }
    }
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    print("display Notification");
    print(receivedNotification);
    print(receivedNotification.payload);
    if(receivedNotification.category==NotificationCategory.Call) {
      storage.write("current_id", receivedNotification.id ?? -1);
      print("display Notification current call id ${receivedNotification.id}");
    }
    else {
      Future.delayed(Duration(seconds: 5)).then((value) async {
        print("display Notification last call id ${receivedNotification.id}");
        await AwesomeNotifications().dismiss(receivedNotification.id ?? -1);
        print("display Notification cancelled");
      });
    }
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    print("dismiss");
    print(receivedAction);
    Map<String, String?>? payload = receivedAction.payload;
    if(receivedAction.buttonKeyPressed=="REJECT") {
      if(payload?['category']=="call" || payload?['path'] == "/call") {
        rejectCall(payload?['ch_id'] ?? "-1");
      }
      if(payload?['category']=="chat" || payload?['path'] == "/chat") {
        rejectChat(payload?['ch_id'] ?? "", payload?['user_id'] ?? "-1");
      }
    }

    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    print("receivedAction.buttonKeyPressedddd");
    print(receivedAction);
    print(receivedAction.buttonKeyPressed);
    print(receivedAction.buttonKeyPressed=="ACCEPT");
    print(receivedAction.buttonKeyPressed=="REJECT");

    Map<String, String?>? payload = receivedAction.payload;

    final GlobalNotifier globalNotifier = Get.find();
    print("sswebnotifier: before notification action ${globalNotifier.showSession}");
    globalNotifier.updateValue("notification");
    print("sswebnotifier: after notification action ${globalNotifier.showSession}");

    if(receivedAction.buttonKeyPressed=="ACCEPT") {
      print("created");
      print(receivedAction);
      print("payload");
      print(receivedAction.payload);
      print(payload?['category'] == "call" || payload?['path'] == "/call");

      if (payload?['category'] == "call" || payload?['path'] == "/call") {
        print(payload?['path'] ?? "/splash");
        print(payload?['path'] ?? "/splash");
        Get.toNamed(
            payload?['path'] ?? "/splash",
            arguments: {
              "user": UserModel(
                  id: int.parse(payload?['user_id'] ?? "-1"),
                  name: payload?['name'] ?? "",
                  profile: payload?['profile'] ?? "",
                  mobile: ''
              ),
              "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
              "meet_id": payload?['meet_id'] ?? "",
              "meetingID": payload?['meetingID'] ?? "",
              "sessionID": payload?['sessionID'] ?? "",
              "wallet": double.parse(payload?['wallet'] ?? "0"),
              "type": "call",
              "type": "REQUESTED",
              "action": "ACCEPT",
              "session_history": SessionHistoryModel.fromJson(
                  json.decode(payload?['session_history'] ?? "{}")),
            }
        );
      }
      else if(payload?['category']=="chat" || payload?['path'] == "/chat") {
        Get.toNamed(
            payload?['path'] ?? "/splash",
            arguments: {
              "user": UserModel(
                  id: int.parse(payload?['user_id'] ?? "-1"),
                  name: payload?['name'] ?? "",
                  profile: payload?['profile'] ?? "",
                  mobile: ''
              ),
              "user_id" : int.parse(payload?['user_id'] ?? "-1"),
              "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
              "type": "REQUESTED",
              "action": "ACCEPT",
            }
        );
      }
    }
    else {
      if(payload?['category']=="call" || payload?['path'] == "/call") {
        Get.toNamed(
            payload?['path'] ?? "/splash",
            arguments: (payload?['path'] ?? "/splash") == "/call" ?
            {
              "user": UserModel(
                  id: int.parse(payload?['user_id'] ?? "-1"),
                  name: payload?['name'] ?? "",
                  profile: payload?['profile'] ?? "",
                  mobile: ''
              ),
              "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
              "meet_id": payload?['meet_id'] ?? "",
              "meetingID": payload?['meetingID'] ?? "",
              "sessionID": payload?['sessionID'] ?? "",
              "wallet": double.parse(payload?['wallet'] ?? "0"),
              "type": "REQUESTED",
              "action" : "NOT DECIDED",
              "session_history": SessionHistoryModel.fromJson(
                  json.decode(payload?['session_history'] ?? "{}")),
            } : null
        );
      }
      else if(payload?['category']=="chat" || payload?['path'] == "/chat") {
        Get.toNamed(
            payload?['path'] ?? "/splash",
            arguments: {
              "user": UserModel(
                  id: int.parse(payload?['user_id'] ?? "-1"),
                  name: payload?['name'] ?? "",
                  profile: payload?['profile'] ?? "",
                  mobile: ''
              ),
              "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
              "type": "REQUESTED",
              "action" : "NOT DECIDED"
            }
        );
      }
    }
  }


// awesomeNotifications.setListeners(
//     onActionReceivedMethod: (receivedAction) async {
//       print("receivedAction.buttonKeyPressed");
//       print(receivedAction.buttonKeyPressed);
//       print(receivedAction.buttonKeyPressed=="ACCEPT");
//
//       if(receivedAction.buttonKeyPressed=="ACCEPT") {
//         print("created");
//         print(receivedAction);
//         print("payload");
//         print(receivedAction.payload);
//         print(payload?['category']=="call" || payload?['path']=="/call");
//
//         if(payload?['category']=="call" || payload?['path']=="/call") {
//           print(payload?['path'] ?? "/splash");
//           print(payload?['path'] ?? "/splash");
//           Get.toNamed(
//               payload?['path'] ?? "/splash",
//               arguments: {
//                 "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                     mobile: ''
//                 ),
//                 "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
//                 "meet_id": payload?['meet_id'] ?? "",
//                 "meetingID": payload?['meetingID'] ?? "",
//                 "sessionID": payload?['sessionID'] ?? "",
//                 "wallet": double.parse(payload?['wallet'] ?? "0"),
//                 "type": "call",
//                 "type": "REQUESTED",
//                 "action" : "ACCEPT",
//                 "session_history" : SessionHistoryModel.fromJson(json.decode(payload?['session_history']??"{}")),
//               }
//           );
//         }
//         else if(payload?['category']=="chat" || payload?['path']=="/chat") {
//           Get.toNamed(
//               payload?['path'] ?? "/splash",
//               arguments: {
//                 "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                     mobile: ''
//                 ),
//                 "ch_id": int.parse(payload?['ch_id'] ?? "-1"),
//                 "type": "REQUESTED",
//                 "action" : "ACCEPT"
//               }
//           );
//         }
//       }
//       else if(receivedAction.buttonKeyPressed=="REJECT") {
//         print("rejectedddd");
//         if(payload?['category']=="call") {
//           rejectCall(payload?['meetingID'] ?? "", payload?['sessionID'] ?? "", payload?['token'] ?? "", payload?['meet_id'] ?? "");
//         }
//         else if(payload?['category']=="chat") {
//           rejectChat(payload?['ch_id'] ?? "");
//         }
//
//       }
//       else {
//         print("hhhd");
//         Map<String,String?>? payload = receivedAction.payload;
//         print(payload);
//         session(payload??{});
//         // if(payload?['category']=="call") {
//         //   Get.toNamed(
//         //       payload?['path'] ?? "/splash",
//         //       arguments: (payload?['path'] ?? "/splash") == "/call" ?
//         //       {
//         //         "user": UserModel(
//         //             id: int.parse(payload?['user_id'] ?? "-1"),
//         //             name: payload?['name'] ?? "",
//         //             profile: payload?['profile'] ?? "",
//         //             mobile: ''
//         //         ),
//         //         "meetingID": payload?['meetingID'] ?? "",
//         //         "wallet": double.parse(payload?['wallet'] ?? "0"),
//         //         "type": "REQUESTED",
//         //         "action" : "NOT DECIDED",
//         //       } : null
//         //   );
//         // }
//         // else if(payload?['category']=="chat") {
//         //   Get.toNamed(
//         //       payload?['path'] ?? "/splash",
//         //       arguments: {
//         //         "user": UserModel(
//         //             id: int.parse(payload?['user_id'] ?? "-1"),
//         //             name: payload?['name'] ?? "",
//         //             profile: payload?['profile'] ?? "",
//         //             mobile: ''
//         //         ),
//         //         "ch_id": payload?['ch_id'] ?? "",
//         //         "type": "REQUESTED",
//         //         "action" : "NOT DECIDED"
//         //       }
//         //   );
//         // }
//       }
//
//     },
//     onDismissActionReceivedMethod: (receivedAction) async {
//       print("receivedAction");
//       print(receivedAction);
//     }
// );
}


