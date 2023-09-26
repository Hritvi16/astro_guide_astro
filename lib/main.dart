import 'dart:async';
import 'package:astro_guide_astro/colors/MyColors.dart';
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
import 'package:timezone/data/latest.dart' as tz;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Inside Background Handler");
    await Firebase.initializeApp();
}


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
    await NotificationHelper.initFcm();

  tz.initializeTimeZones();

  runApp(MyApp());
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
