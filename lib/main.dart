import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/call/CallController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/languages/Languages.dart';
import 'package:astro_guide_astro/notifier/GlobalNotifier.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/AppBinding.dart';
import 'package:astro_guide_astro/controllers/theme/ThemesController.dart';
import 'package:astro_guide_astro/notification_helper/NotificationHelper.dart';
import 'package:astro_guide_astro/routes/routes.dart';
import 'package:astro_guide_astro/themes/Themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:month_year_picker/month_year_picker.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Inside Background Handler");
    await Firebase.initializeApp();
}





Future<void> initializeService() async {

  final service = FlutterBackgroundService();
  /// OPTIONAL, using custom notification channel id
  // const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //   'my_foreground', // id
  //   'MY FOREGROUND SERVICE', // title
  //   description:
  //   'This channel is used for important notifications.', // description
  //   importance: Importance.low, // importance must be at low or higher level
  // );

  AwesomeNotifications().initialize(
    null, // icon for your app notification
    [
      NotificationChannel(
        channelKey: 'my_foreground',
        channelName: 'MY FOREGROUND SERVICE',
        channelDescription: 'This channel is used for important notifications.',
        importance: NotificationImportance.Low,
      ),
    ],
  );


  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();
  //
  // if (Platform.isIOS || Platform.isAndroid) {
  //   await flutterLocalNotificationsPlugin.initialize(
  //     const InitializationSettings(
  //       iOS: DarwinInitializationSettings(),
  //       android: AndroidInitializationSettings('ic_bg_service_small'),
  //     ),
  //   );
  // }

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //     AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'ASTROGUIDE SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      // onBackground: onIosBackground,
    ),
  );
}

void main() async {
  //HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  AndroidAlarmManager.initialize();

  await NotificationHelper.initFcm();
  await deleteAllFilesInDocumentsDirectory();

    final storage = GetStorage();

    if(storage.read("permission")!=true) {
      await checkPermission();
    }

  tz.initializeTimeZones();

  ByteData data=await PlatformAssetBundle().load('assets/ca/cert.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  Directory directory = await getApplicationDocumentsDirectory();


  final int alarmManagerPort = 4711;
  AndroidAlarmManager.periodic(
    const Duration(minutes: 5), // Repeat every hour
    alarmManagerPort,
    callbackDispatcher,
    startAt: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
        DateTime.now().hour, DateTime.now().minute + 1),
    exact: true,
    wakeup: true,
  );

  runApp(LifecycleAwareWidget(child: MyApp(), directory: directory,));
}

@pragma('vm:entry-point')
void callbackDispatcher() async {
  final service = FlutterBackgroundService();
  if (!(await service.isRunning())) {
    await initializeService();
  }

  // Check if the service is running, and if not, start it

}

Future<void> deleteAllFilesInDirectory(String directoryPath) async {
  final dir = Directory(directoryPath);
  if (await dir.exists()) {
    final files = await dir.list().toList();
    for (final file in files) {
      print("deleted filesss ${file.path}");
      if (file is File) {
        if (file.path.endsWith('.mp4') || file.path.endsWith('.m4a')) {
          await file.delete();
        }
      }
      // else if (file is Directory) {
      //   await deleteAllFilesInDirectory(file.path);
      // }
    }
  }
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when use custom notification
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        /// OPTIONAL for use custom notification
        /// the notification id must be equals with AndroidConfiguration when you call configure() method.
        // flutterLocalNotificationsPlugin.show(
        //   888,
        //   'COOL SERVICE',
        //   'Awesome ${DateTime.now()}',
        //   const NotificationDetails(
        //     android: AndroidNotificationDetails(
        //       'my_foreground',
        //       'MY FOREGROUND SERVICE',
        //       icon: 'ic_bg_service_small',
        //       ongoing: true,
        //     ),
        //   ),
        // );

        // if you don't using custom notification, uncomment this
        // service.setForegroundNotificationInfo(
        //   title: "TrueSender Service",
        //   content: "Running background service",
        // );
      }
    }

    /// you can see this log in logcat
    // print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

    // test using external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.model;
      }

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.model;
      }
    }
    catch(ex) {
      print("ex");
      print(ex);
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
}

Future<void> deleteAllFilesInDocumentsDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  await deleteAllFilesInDirectory(directory.path);
  print("deleted filesss completed");
}

Future<void> checkPermission() async {
  // await Essential.requestMediaPermission();

  print("await Permission.microphone.status");
  print(await Permission.microphone.status);

  print("await Permission.microphone.status");
  print(await Permission.camera.request());
  print(await Permission.camera.status);

  final storage = GetStorage();
  storage.write("permission", true);
}

class MyApp extends StatelessWidget {
  final ThemesController themeController = Get.put(ThemesController());
  final storage = GetStorage();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyColors.colorPrimary,
    ));
    return GetMaterialApp(
      localizationsDelegates: [
        // GlobalMaterialLocalizations.delegate,
        // MonthYearPickerLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Locale(storage.read('language')??'en'), // Default locale
      fallbackLocale: Locale(storage.read('language')??'en'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Essential.getThemeMode(themeController.theme),
      getPages: Routes.routes,
      initialRoute: Routes.INITIAL,
      initialBinding: AppBinding(),
    );
  }

}


class LifecycleAwareWidget extends StatefulWidget {
  final Widget child;
  final Directory directory;


  const LifecycleAwareWidget({required this.child, required this.directory});

  @override
  _LifecycleAwareWidgetState createState() => _LifecycleAwareWidgetState();
}

class _LifecycleAwareWidgetState extends State<LifecycleAwareWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("sswebmain: lifecycle $state");
    // final storage = GetStorage();
    // print("sswebmain: calling_status ${calling_status}");
    // Handle app lifecycle changes here
    if (state == AppLifecycleState.resumed) {
      manageCall();
      // The app has come to the foreground
    } else if (state == AppLifecycleState.inactive) {
      // The app is in an inactive state (e.g., in a phone call)
    } else if (state == AppLifecycleState.paused) {
      // The app has gone into the background
    } else if (state == AppLifecycleState.detached) {
      // The app is terminated or detached
    }
  }

  void manageCall() async {
    final GlobalNotifier globalNotifier = Get.find();
    print("ssweb: lifecycle callController");
    print(globalNotifier.callController);


    print("sswebmain filee: calling_status ${globalNotifier.callingStatus.value}");
    String calling_status = globalNotifier.callingStatus.value;
    calling_status = calling_status.isEmpty ? "CANCELLED" : calling_status;

    if(globalNotifier.callController.value!=null) {
      CallController callController = globalNotifier.callController.value!;
      if(calling_status=="back") {
        //for call back commented this
        // callController.back();
      }
      else if(calling_status.isNotEmpty){
        //purposely commented
        // callController.endMeeting("manage call main.dart 149", calling_status, path: widget.directory.path);
      }
      // else {
      //   callController.stopTimer(back: true);
      // }
      globalNotifier.updateCallController(null);
      globalNotifier.updateCallingStatus("");
    }
    // else {
    //   CallController callController = Get.put<CallController>(CallController());
    //   if(calling_status=="back") {
    //     callController.back();
    //   }
    //   else if((calling_status??"").isNotEmpty){
    //     callController.endMeeting("manage call main.dart 163", calling_status, path: widget.directory.path);
    //   }
    //   // else {
    //   //   callController.stopTimer(back: true);
    //   // }
    //   file.writeAsString("");
    // }

    print("sswebmain afterr filee: calling_status ${globalNotifier.callingStatus.value}");
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

