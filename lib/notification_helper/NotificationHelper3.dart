import 'dart:convert';
import 'dart:io';

import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/MeetingConstants.dart';
import 'package:astro_guide_astro/controllers/call/CallController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/repositories/MeetingRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';

class NotificationHelper {
  // FCM Messaging
  static late FirebaseMessaging messaging;

  // Notification lib
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    print("inittttttt");
    try {
      await Firebase.initializeApp();
      // TODO: uncomment this line if you connected to firebase via cli
      //options: DefaultFirebaseOptions.currentPlatform,

      messaging = FirebaseMessaging.instance;


      // initialize notifications channel and libraries
      await initNotification();

      // notification settings handler
      await setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      // await generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

      // listen to notifications click and actions
      listenToActionButtons();
      // }
    } catch (error) {
      print(error.toString());
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      // Logger().e(error);
    }
  }

  /// when user click on notification or click on button on the notification
  static listenToActionButtons() {
    // Only after at least the action method is set, the notification events are delivered
    // awesomeNotifications.setListeners(
        // onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        // onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        // onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        // onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    // );
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
  // static Future<String> generateFcmToken(AstroProvider astroProvider) async {
  static Future<String> generateFcmToken() async {
    await initFcm();
    try {
      String? token = await messaging.getToken();

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
    print("categoryyyyy backk");
    print(message.data);
    print(message.data['category']);
    _showNotification(
        id: 1,
        title: message.notification?.title ?? 'Title',
        body: message.notification?.body ?? 'Body',
        payload: message.data.cast(),
        notificationLayout: NotificationLayout.BigText,
        category: message.data['category']=="call" || message.data['category']=="chat"  ? NotificationCategory.Call : message.data['category']=="cancelled" ? NotificationCategory.MissedCall : null
    );
  }

  //handle fcm notification when app is open
  @pragma('vm:entry-point')
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    print("categoryyyyy");
    print(message);
    print(message.data);
    bool go = true;
    _showNotification(
        id: 1,
        title: message.notification?.title ?? 'Title',
        body: message.notification?.body ?? 'Body',
        payload: message.data.cast(),
        notificationLayout: NotificationLayout.BigText,
        category: message.data['category']=="call" || message.data['category']=="chat"  ? NotificationCategory.Call : message.data['category']=="cancelled" ? NotificationCategory.MissedCall : null
    );
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
        awesomeNotifications.createNotification(
            content: NotificationContent(
              id: id,
              title: title,
              body: body,
              category: category,
              groupKey: groupKey ?? NotificationChannels.generalGroupKey,
              channelKey: channelKey ?? NotificationChannels.generalChannelKey,
              showWhen: true, // Hide/show the time elapsed since notification was displayed
              payload: payload, // data of the notification (it will be used when user clicks on notification)
              // notificationLayout: NotificationLayout.BigPicture, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
              notificationLayout: notificationLayout ?? NotificationLayout.Default, // notification shape (message,media player..etc) For ex => NotificationLayout.Messaging
              autoDismissible: true, // dismiss notification when user clicks on it
              summary: summary, // for ex: New message (it will be shown on status bar before notificaiton shows up)
              largeIcon: largeIcon, // image of sender for ex (when someone send you message his image will be shown)
              fullScreenIntent: true,
              wakeUpScreen: true,
              locked: true,
              customSound: 'asset://assets/audio/notification.mp3'
            ),
            actionButtons: category==NotificationCategory.Call ?
            [
              NotificationActionButton(key: "ACCEPT", label: "ACCEPT", color: MyColors.colorSuccess, autoDismissible: true),
              NotificationActionButton(key: "REJECT", label: "REJECT", color: MyColors.colorError, autoDismissible: true),
            ] : null
        );
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
            // channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelKey: NotificationChannels.generalChannelKey,
            channelName: NotificationChannels.generalChannelName,
            // groupKey: NotificationChannels.generalGroupKey,
            channelDescription: 'Notification channel for general notifications',
            defaultColor: Colors.green,
            ledColor: Colors.white,
            channelShowBadge: true,
            playSound: true,
            importance: NotificationImportance.Max,
            soundSource: 'asset://assets/audio/notification.mp3',
          ),
        ],

        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: NotificationChannels.generalChannelGroupKey,
            channelGroupName: NotificationChannels.generalChannelGroupName,
          ),
        ]);
  }

}

class NotificationChannels {
  // chat channel (for messages only)
  static String get chatChannelKey => "chat_channel";
  static String get chatChannelName => "Chat channel";
  static String get chatGroupKey => "chat group key";
  static String get chatChannelGroupKey => "chat_channel_group";
  static String get chatChannelGroupName => "Chat notifications channels";
  static String get chatChannelDescription => "Chat notifications channels";

  // general channel (for all other notifications)
  static String get generalChannelKey => "fitness_channel";
  static String get generalGroupKey => "basic group key";
  static String get generalChannelGroupKey => "basic_channel_group";
  static String get generalChannelGroupName => "Fitness public notifications channels";
  static String get generalChannelName => "Fitness notifications channels";
  static String get generalChannelDescription => "Notification channel for messages";
}

class NotificationController {
}
