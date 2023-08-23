// import 'dart:convert';
// import 'dart:io';
//
// import 'package:astro_guide_astro/colors/MyColors.dart';
// import 'package:astro_guide_astro/constants/MeetingConstants.dart';
// import 'package:astro_guide_astro/controllers/call/CallController.dart';
// import 'package:astro_guide_astro/essential/Essential.dart';
// import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
// import 'package:astro_guide_astro/models/user/UserModel.dart';
// import 'package:astro_guide_astro/providers/MeetingProvider.dart';
// import 'package:astro_guide_astro/repositories/MeetingRepository.dart';
// import 'package:astro_guide_astro/services/networking/ApiService.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// // import 'package:astro_guide_astro/providers/UserProvider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
// // import 'package:permission_handler/permission_handler.dart';
//
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// // IMPORTANT NOTE
// // if you have errors here (undefined or awesome notifications doesnt have this funcition)
// // this mean you are using old version of awesome notifications so you just need to go to
// // template on github and copy older version of fcm_helper.dart class and paste it here
// // link: https://github.com/EmadBeltaje/flutter_getx_template/commits/master/lib/utils/fcm_helper.dart
// // you can copy the hole file of initial commit and paste here and everything would be fine
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
//
//
//
// //////////////////////////////////////////////////////////
// //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// // DUPLICATED NOTIFICATION ISSUE
// //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// // you may get 2 notifications shown while you only sent 1 but why ?
// // simply bcz one notification is from fcm and the other one is from us (awesome notification)
// // but what does that mean!
// // if you take a look here at this link https://firebase.google.com/docs/cloud-messaging/concept-options#notifications_and_data_messages
// // you will know that notifications are 2 types
// // - Notification message (which automatically show notification which lead to duplicated)
// // - Data message (dont show notification so you must show it using awesome notifications)
// // so if you want to get rid of duplicated notifications just stop sending (Notification message) and start sending (data message) instead
// // and this is in most of time (api developer) responsibility
// //////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
//
// class NotificationHelper {
//   // FCM Messaging
//   static late FirebaseMessaging messaging;
//
//   // Notification lib
//   static AwesomeNotifications awesomeNotifications = AwesomeNotifications();
//
//   /// this function will initialize firebase and fcm instance
//   static Future<void> initFcm() async {
//     try {
//           await Firebase.initializeApp();
//         // TODO: uncomment this line if you connected to firebase via cli
//         //options: DefaultFirebaseOptions.currentPlatform,
//
//         messaging = FirebaseMessaging.instance;
//
//
//         // initialize notifications channel and libraries
//         await initNotification();
//
//         // notification settings handler
//         await setupFcmNotificationSettings();
//
//         // generate token if it not already generated and store it on shared pref
//         // await generateFcmToken();
//
//         // background and foreground handlers
//         FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
//         FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
//
//         // listen to notifications click and actions
//         listenToActionButtons();
//       // }
//     } catch (error) {
//       // if you are connected to firebase and still get error
//       // check the todo up in the function else ignore the error
//       // or stop fcm service from main.dart class
//       // Logger().e(error);
//     }
//   }
//
//   /// when user click on notification or click on button on the notification
//   static listenToActionButtons() {
//     // Only after at least the action method is set, the notification events are delivered
//     awesomeNotifications.setListeners(
//         onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
//         onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
//         onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
//         onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
//     );
//   }
//
//   ///handle fcm notification settings (sound,badge..etc)
//   static Future<void> setupFcmNotificationSettings() async {
//     //show notification with sound and badge
//     messaging.setForegroundNotificationPresentationOptions(
//       alert: true,
//       sound: true,
//       badge: true,
//     );
//
//     //NotificationSettings settings
//     await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       provisional: true,
//     );
//   }
//
//   /// generate and save fcm token if its not already generated (generate only for 1 time)
//   // static Future<String> generateFcmToken(AstroProvider astroProvider) async {
//   static Future<String> generateFcmToken() async {
//     await initFcm();
//     try {
//       String? token = await messaging.getToken();
//
//       return token??"";
//     } catch (error) {
//       print(error.toString());
//     }
//
//     return "";
//   }
//
//   /// this method will be triggered when the app generate fcm
//   /// token successfully
//   // static sendFcmTokenToServer(String token, UserProvider userProvider) {
//   //   final storage = GetStorage();
//   //
//   //   Map<String, dynamic> data = {
//   //     ApiConstants.act : ApiConstants.addFCM,
//   //     ApiConstants.fcm :token,
//   //   };
//   //
//   //
//   //
//   //   userProvider.insertFCM(data).then((value) {
//   //     if(value.code==1) {
//   //       storage.write("fcm", token);
//   //     }
//   //   });
//   // }
//
//   ///handle fcm notification when app is closed/terminated
//   /// if you are wondering about this annotation read the following
//   /// https://stackoverflow.com/a/67083337
//   @pragma('vm:entry-point')
//   static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
//     print("categoryyyyy");
//     print(message.data['category']);
//     _showNotification(
//       id: 1,
//       title: message.notification?.title ?? 'Title',
//       body: message.notification?.body ?? 'Body',
//       payload: message.data.cast(),
//       notificationLayout: NotificationLayout.BigText,
//       category: message.data['category']=="call" || message.data['category']=="chat"  ? NotificationCategory.Call : message.data['category']=="cancelled" ? NotificationCategory.MissedCall : null
//     );
//   }
//
//   //handle fcm notification when app is open
//   static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
//     print("categoryyyyy");
//     print(message.data);
//     bool go = true;
//     if(message.data['category']=="chat" || message.data['category']=="call") {
//       go = false;
//       Map<String, dynamic> arguments= {
//         "user": UserModel(
//           id: int.parse(message.data['user_id'] ?? "-1"),
//           name: message.data['name'] ?? "",
//           profile: message.data['profile'] ?? "",
//         ),
//         "ch_id": int.parse(message.data['ch_id'] ?? "-1"),
//         "type": "REQUESTED",
//         "action" : "NOT DECIDED"
//       };
//
//       if(message.data['category']=="call")
//         arguments.addAll(
//           {
//             "session_history" : SessionHistoryModel.fromJson(json.decode(message.data['session_history'])),
//             "meetingID": message.data['meetingID'] ?? "-1",
//             "sessionID": message.data['sessionID'] ?? "-1",
//           }
//         );
//
//       Get.toNamed(
//           message.data['path'] ?? "/splash",
//           arguments: arguments
//       );
//     }
//     if(go) {
//       if(message.data['category']=="waitlist") {
//         final storage = GetStorage();
//
//         print(storage.read("calling"));
//         if(storage.read("calling")!=null) {
//           CallController callController = storage.read("calling");
//           callController.back();
//         }
//       }
//
//       _showNotification(
//           id: 1,
//           title: message.notification?.title ?? 'Title',
//           body: message.notification?.body ?? 'Body',
//           payload: message.data.cast(),
//           // pass payload to the notification card so you can use it (when user click on notification)
//           notificationLayout: NotificationLayout.BigText,
//           category: message.data['category'] == "call" ||
//               message.data['category'] == "chat"
//               ? NotificationCategory.Call
//               : message.data['category'] == "cancelled" || message.data['category']=="waitlist" ? NotificationCategory
//               .MissedCall : null
//       );
//     }
//   }
//
//   //display notification for user with sound
//   static _showNotification(
//       {required String title,
//         required String body,
//         required int id,
//         String? channelKey,
//         String? groupKey,
//         NotificationLayout? notificationLayout,
//         NotificationCategory? category,
//         String? summary,
//         Map<String, String>? payload,
//         String? largeIcon}) async {
//     awesomeNotifications.isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         awesomeNotifications.requestPermissionToSendNotifications();
//       } else {
//         // u can show notification
//         awesomeNotifications.createNotification(
//           content: NotificationContent(
//             id: id,
//             title: title,
//             body: body,
//             category: category,
//             groupKey: groupKey ?? NotificationChannels.generalGroupKey,
//             channelKey: channelKey ?? NotificationChannels.generalChannelKey,
//             showWhen: true, // Hide/show the time elapsed since notification was displayed
//             payload: payload, // data of the notification (it will be used when user clicks on notification)
//             // notificationLayout: NotificationLayout.BigPicture, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
//             notificationLayout: notificationLayout ?? NotificationLayout.Default, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
//             autoDismissible: true, // dismiss notification when user clicks on it
//             summary: summary, // for ex: New message (it will be shown on status bar before notificaiton shows up)
//             largeIcon: largeIcon, // image of sender for ex (when someone send you message his image will be shown)
//             fullScreenIntent: true,
//             wakeUpScreen: true,
//             locked: true,
//           ),
//           actionButtons: category==NotificationCategory.Call ?
//           [
//             NotificationActionButton(key: "ACCEPT", label: "ACCEPT", color: MyColors.colorSuccess, autoDismissible: true),
//             NotificationActionButton(key: "REJECT", label: "REJECT", color: MyColors.colorError, autoDismissible: true),
//           ] : null
//         );
//       }
//     });
//
//     awesomeNotifications.setListeners(
//       onActionReceivedMethod: (receivedAction) async {
//         print("receivedAction.buttonKeyPressed");
//         print(receivedAction.buttonKeyPressed);
//         print(receivedAction.buttonKeyPressed=="ACCEPT");
//
//         if(receivedAction.buttonKeyPressed=="ACCEPT") {
//           print("created");
//           print(receivedAction);
//           print("payload");
//           print(receivedAction.payload);
//
//           if(payload?['category']=="call") {
//             Get.toNamed(
//                 payload?['path'] ?? "/splash",
//                 arguments: {
//                   "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                   ),
//                   "meet_id": payload?['meet_id'] ?? "",
//                   "meetingID": payload?['meetingID'] ?? "",
//                   "sessionID": payload?['sessionID'] ?? "",
//                   "type": "call"
//                 }
//             );
//           }
//           else if(payload?['category']=="chat") {
//             Get.toNamed(
//                 payload?['path'] ?? "/splash",
//                 arguments: {
//                   "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                   ),
//                   "ch_id": payload?['ch_id'] ?? "",
//                   "type": "REQUESTED",
//                   "action" : "ACCEPT"
//                 }
//             );
//           }
//         }
//         else if(receivedAction.buttonKeyPressed=="REJECT") {
//           print("rejectedddd");
//           if(payload?['category']=="call") {
//             rejectCall(payload?['meetingID'] ?? "", payload?['sessionID'] ?? "", payload?['token'] ?? "", payload?['meet_id'] ?? "");
//           }
//           else if(payload?['category']=="chat") {
//             rejectChat(payload?['ch_id'] ?? "");
//           }
//
//         }
//         else {
//           print("hhhd");
//           Map<String,String?>? payload = receivedAction.payload;
//           if(payload?['category']=="call") {
//             Get.toNamed(
//                 payload?['path'] ?? "/splash",
//                 arguments: (payload?['path'] ?? "/splash") == "/call" ?
//                 {
//                   "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                   ),
//                   "meetingID": payload?['meetingID'] ?? "",
//                   "type": "screen"
//                 } : null
//             );
//           }
//           else if(payload?['category']=="chat") {
//             Get.toNamed(
//                 payload?['path'] ?? "/splash",
//                 arguments: {
//                   "user": UserModel(
//                     id: int.parse(payload?['user_id'] ?? "-1"),
//                     name: payload?['name'] ?? "",
//                     profile: payload?['profile'] ?? "",
//                   ),
//                   "ch_id": payload?['ch_id'] ?? "",
//                   "type": "REQUESTED",
//                   "action" : "NOT DECIDED"
//                 }
//             );
//           }
//         }
//
//       }
//     );
//
//   }
//
//   ///init notifications channels
//   static initNotification() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     //   print('User granted permission');
//     // } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     //   print('User granted provisional permission');
//     // } else {
//     //   print('User declined or has not accepted permission');
//     // }
//     await awesomeNotifications.initialize(
//         null, // null mean it will show app icon on the notification (status bar)
//         [
//           NotificationChannel(
//             channelGroupKey: NotificationChannels.generalChannelGroupKey,
//             channelKey: NotificationChannels.generalChannelKey,
//             channelName: NotificationChannels.generalChannelName,
//             groupKey: NotificationChannels.generalGroupKey,
//             channelDescription: 'Notification channel for general notifications',
//             defaultColor: Colors.green,
//             ledColor: Colors.white,
//             channelShowBadge: true,
//             playSound: true,
//             importance: NotificationImportance.Max,
//           ),
//           NotificationChannel(
//               channelGroupKey: NotificationChannels.chatChannelGroupKey,
//               channelKey: NotificationChannels.chatChannelKey,
//               channelName: NotificationChannels.chatChannelName,
//               groupKey: NotificationChannels.chatGroupKey,
//               channelDescription: 'Notification channel for messages',
//               defaultColor: Colors.green,
//               ledColor: Colors.white,
//               channelShowBadge: true,
//               playSound: true,
//
//               importance: NotificationImportance.Max)
//         ],
//
//         channelGroups: [
//           NotificationChannelGroup(
//             channelGroupKey: NotificationChannels.generalChannelGroupKey,
//             channelGroupName: NotificationChannels.generalChannelGroupName,
//           ),
//           NotificationChannelGroup(
//             channelGroupKey: NotificationChannels.chatChannelGroupKey,
//             channelGroupName: NotificationChannels.chatChannelGroupName,
//           )
//         ]);
//   }
//
//   static Future<void> rejectCall(String meetingID, String sessionID, String token, String meet_id) async {
//     final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
//     final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;
//
//     final storage = GetStorage();
//
//     Map<String, String> data = {
//       MeetingConstants.meetingID: meetingID,
//       MeetingConstants.sessionID: sessionID,
//       MeetingConstants.token: token,
//       MeetingConstants.meet_id: meet_id.toString(),
//       MeetingConstants.status: "REJECTED",
//     };
//     print(data);
//
//
//
//     await meetingProvider.end(data, storage.read("access")).then((
//         response) async {
//       print(response.toJson());
//       if (response.code == 1) {}
//       else if (response.code == -2) {}
//       else {
//         Essential.showSnackBar(response.message);
//       }
//     });
//   }
//
//   static Future<void> rejectChat(String ch_id) async {
//     print("CHAT REJECTED ${ch_id}");
//     // final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
//     // final MeetingProvider meetingProvider = Get.put(MeetingProvider(meetingRepository));;
//     //
//     // final storage = GetStorage();
//     //
//     // Map<String, String> data = {
//     //   MeetingConstants.meetingID: meetingID,
//     //   MeetingConstants.sessionID: sessionID,
//     //   MeetingConstants.token: token,
//     //   MeetingConstants.meet_id: meet_id.toString(),
//     //   MeetingConstants.status: "REJECTED",
//     // };
//     // print(data);
//     //
//     //
//     //
//     // await meetingProvider.end(data, storage.read("access")).then((
//     //     response) async {
//     //   print(response.toJson());
//     //   if (response.code == 1) {}
//     //   else if (response.code == -2) {}
//     //   else {
//     //     Essential.showSnackBar(response.message);
//     //   }
//     // });
//   }
// }
//
// class NotificationChannels {
//   // chat channel (for messages only)
//   static String get chatChannelKey => "chat_channel";
//   static String get chatChannelName => "Chat channel";
//   static String get chatGroupKey => "chat group key";
//   static String get chatChannelGroupKey => "chat_channel_group";
//   static String get chatChannelGroupName => "Chat notifications channels";
//   static String get chatChannelDescription => "Chat notifications channels";
//
//   // general channel (for all other notifications)
//   static String get generalChannelKey => "fitness_channel";
//   static String get generalGroupKey => "basic group key";
//   static String get generalChannelGroupKey => "basic_channel_group";
//   static String get generalChannelGroupName => "Fitness public notifications channels";
//   static String get generalChannelName => "Fitness notifications channels";
//   static String get generalChannelDescription => "Notification channel for messages";
// }
//
// class NotificationController {
//
//   /// Use this method to detect when a new notification or a schedule is created
//   @pragma("vm:entry-point")
//   static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
//     print("created");
//     print(receivedNotification);
//     print(receivedNotification.payload);
//     // Your code goes here
//   }
//
//   /// Use this method to detect every time that a new notification is displayed
//   @pragma("vm:entry-point")
//   static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
//     print("display");
//     print(receivedNotification);
//     print(receivedNotification.payload);
//     // Your code goes here
//   }
//
//   /// Use this method to detect if the user dismissed a notification
//   @pragma("vm:entry-point")
//   static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
//     print("dismiss");
//     print(receivedAction);
//
//     // Your code goes here
//   }
//
//   /// Use this method to detect when the user taps on a notification or action button
//   @pragma("vm:entry-point")
//   static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
//     print("receivedAction.buttonKeyPressedddd");
//     print(receivedAction);
//     print(receivedAction.buttonKeyPressed);
//   }
// }
