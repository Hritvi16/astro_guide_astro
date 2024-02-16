import 'dart:async';
import 'dart:io';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/GlobalVariables.dart';
import 'package:astro_guide_astro/controllers/call/CallController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/languages/Languages.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:month_year_picker/month_year_picker.dart';

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



void main() async {
  //HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
    await NotificationHelper.initFcm();

  tz.initializeTimeZones();

  ByteData data=await PlatformAssetBundle().load('assets/ca/cert.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  Directory directory = await getApplicationDocumentsDirectory();

  runApp(LifecycleAwareWidget(child: MyApp(), directory: directory,));
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
        MonthYearPickerLocalizations.delegate,
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
    final storage = GetStorage();
    print("ssweb: lifecycle callController");
    print(storage.read("calling"));

    
    File file = File("${widget.directory.path}/calling.txt");
    print("sswebmain filee: calling_status ${await file.readAsString()}");
    String calling_status = await file.readAsString();
    calling_status = calling_status.isEmpty ? "CANCELLED" : calling_status;

    if(storage.read("calling")!=null) {
      CallController callController = storage.read("calling");
      if(calling_status=="back") {
        callController.back();
      }
      else if(calling_status.isNotEmpty){
        callController.endMeeting(calling_status, path: widget.directory.path);
      }
      // else {
      //   callController.stopTimer(back: true);
      // }
      storage.remove("calling");
      file.writeAsString("");
    }
    else {
      CallController callController = Get.put<CallController>(CallController());
      if(calling_status=="back") {
        callController.back();
      }
      else if((calling_status??"").isNotEmpty){
        callController.endMeeting(calling_status, path: widget.directory.path);
      }
      // else {
      //   callController.stopTimer(back: true);
      // }
      file.writeAsString("");
    }

    print("sswebmain afterr filee: calling_status ${await file.readAsString()}");
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

