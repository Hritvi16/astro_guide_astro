import 'dart:io';

import 'package:astro_guide_astro/cache_manager/CacheManager.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/TimezoneConstants.dart';
import 'package:astro_guide_astro/dialogs/InfoDialog.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/providers/TokenProvider.dart';
import 'package:astro_guide_astro/repositories/TokenRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Essential {
  static void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }

  static void showInfoDialog(String text, {String? btn}) {
    Get.dialog(
      InfoDialog(
        text: text,
        btn: btn??"OK",
      ),
      barrierDismissible: false,
    );
  }


  static Future<dynamic> showBasicDialog(String text, String btn1, String btn2) async {
    return await Get.dialog(
      BasicDialog(
        text: text,
        btn1: btn1,
        btn2: btn2,
      ),
      barrierDismissible: false,
    );
  }


  static void checkLength(int length, TextEditingController controller) {
    if(controller!.text.length>length) {
      controller!.text = controller!.text.substring(0, length);
      controller!.selection = TextSelection.fromPosition(TextPosition(offset: controller!.text.length));
    }
    else {
    }
  }


  static String generateOTP() {
    var rnd = math.Random();
    var next = rnd.nextDouble() * 1000000;
    while (next < 100000) {
      next *= 10;
    }
    return next.toInt().toString();
  }

  static link(String link) {
    launchUrlString(link);
  }

  static share() {
    Share.share("https://play.google.com/store/apps/details?id=com.ss.astro_guide", subject: 'Hey, looking for an app to grow your income?\n Here it is!');
  }

  static showSnackBar(String message, {int? time}) {
    Get.snackbar( "", message, snackPosition: SnackPosition.BOTTOM, backgroundColor: MyColors.black, margin: EdgeInsets.all(5),  colorText: MyColors.white, duration: Duration(seconds: time??2));
  }

  Future<bool> popUp(String text, String btn1, String btn2) {
    return Get.dialog(
      BasicDialog(
        text: text,
        btn1 : btn1,
        btn2: btn2,
      ),
      barrierDismissible: false,
    ).then((value) {
      if(value==btn1) {
        return true;
      }
      return false;
    });
  }

  static openwhatsapp(String mobile) async{
    var whatsapp ="+91$mobile";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if(await launch(whatappURL_ios, forceSafariVC: false)){

      }

    }else{
      // android , web
      if( await launch(whatsappURl_android)) {
      }


    }

  }

  static void showBoardList() {
    Get.toNamed('/boardList')?.then((value) {
      Get.offAllNamed('/home');
    });
  }

  static String getGoogleClientID() {
    return Platform.isAndroid ? ApiConstants.androidGoogleClientID : ApiConstants.iOSGoogleClientID;
  }


  static final TokenRepository tokenRepository = Get.put(TokenRepository(Get.put(ApiService(Get.find()), permanent: true)));
  static late TokenProvider tokenProvider;
  static final storage = GetStorage();
  static Future<dynamic> getNewAccessToken() async {
    tokenProvider = Get.put(TokenProvider(tokenRepository));

    // print(storage.read("access"));

    Map<String, String> data = {
      "token" : storage.read("refresh")??""
    };
    print(data);

    return await tokenProvider.access(data, CommonConstants.essential).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        storage.write("access", response.access_token);
        storage.write("refresh", response.refresh_token);
        return true;
      }
      else {
        print("logout");
        // await logout();
      }
    });
  }

  static Future<void> logout() async {
    await CacheManager.deleteAllKeys();
    storage.write("access", "essential");
    storage.write("refresh", "");
    storage.write("status", "logged out");
    Get.offAllNamed('/login');
  }

  static Color getSessionTypeColor(String type) {
    if(type=="FREE") {
      return MyColors.colorError;
    }
    return MyColors.colorInfoBlue;
  }

  static Color getStatusColor(String status) {
    if(status=="REQUESTED") {
      return MyColors.colorInfoBlue;
    }
    else if(status=="ACTIVE") {
      return MyColors.colorButton;
    }
    else if(status=="WAITLISTED") {
      return MyColors.colorOrange;
    }
    else if(status=="CANCELLED" || status=="MISSED" || status=="REJECTED") {
      return MyColors.colorError;
    }
    else if(status=="COMPLETED") {
      return MyColors.colorSuccess;
    }
    return MyColors.black;
  }

  static Color getSStatusColor(String status) {
    if(status=="REQUESTED") {
      return MyColors.colorInfoBlue;
    }
    else if(status=="ACTIVE") {
      return MyColors.colorSuccess;
    }
    else if(status=="CANCELLED" || status=="ENDED") {
      return MyColors.colorError;
    }
    return MyColors.black;
  }

  static tz.TZDateTime getGMTDate(String date) {
    print(date);
    print("$date+0000");
    try {
      return tz.TZDateTime.parse(TimezoneConstants.location, "$date+0000");
    }
    catch(ex) {
      print("exxxxxxx");
      print(ex);
      return getCurrentDate();
    }
  }

  static tz.TZDateTime getCurrentDate() {
    return tz.TZDateTime.now(TimezoneConstants.location);
  }

  static tz.TZDateTime getConvertedDate(String date) {
    tz.TZDateTime parsed = getGMTDate(date);
    return tz.TZDateTime.from(parsed, TimezoneConstants.currLocation);
  }

  static getDaysDifference(String date) {
    Duration duration = getCurrentDate().difference(getConvertedDate(date));
    return duration.inDays;
  }

  static getMonthsDifference(String date) {
    tz.TZDateTime cur = getCurrentDate();
    tz.TZDateTime join = getConvertedDate(date);
    DateTime curr = DateTime(cur.year, cur.month, 1);
    DateTime joined = DateTime(join.year, join.month, 1);

    if(joined.year==curr.year) {
      if(joined.month==curr.month) {
        return 1;
      }
      else {
        return cur.month - joined.month + 1;
      }
    }
    else {
      return curr.month + (12 - joined.month + 1);
    }
    // Duration duration = getCurrentDate().difference(getConvertedDate(date));
    // return duration.inDays;
  }

  static tz.Location? getLocationFromOffset(int offset, String name) {
    tz.initializeTimeZones();

    final allLocations = tz.timeZoneDatabase.locations.values;

    for (final tz.Location loc in allLocations) {
      final now = tz.TZDateTime.now(loc);
      final timeZoneOffset = now.timeZoneOffset.inMinutes;
      if (timeZoneOffset == offset && loc.currentTimeZone.abbreviation==name) {
        return loc;
      }
    }

    return null;
  }

  static String getDate(String datetime) {
    try {
      return DateFormat("dd MMM, yy").format(Essential.getConvertedDate(datetime));
    }
    catch(ex) {
      print(ex);
      return "";
    }
  }

  static String getTime(String datetime) {
    return DateFormat("hh:mm aa").format(Essential.getConvertedDate(datetime));
  }

  static String getDateTime(String datetime) {
    return datetime.isNotEmpty ? DateFormat("dd MMM, yyyy  hh:mm aa").format(Essential.getConvertedDate(datetime)) : getCurrentDateTime();
  }

  static String getCurrentDateTime() {
    return DateFormat("dd MMM, yyyy  hh:mm aa").format(DateTime.now());
  }


  static String getChatDuration(int? seconds, String started_at, String ended_at) {
    print("started_at");
    print(started_at);
    print(ended_at);
    if(seconds==null) {
      tz.TZDateTime start = getGMTDate(started_at);
      tz.TZDateTime end = getGMTDate(ended_at);

      Duration dur = end.difference(start);
      seconds = dur.inSeconds;
    }


    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String duration = "";
    if(hours>0) {
      duration+="$hours Hour${hours>1 ? "s" : ""}";
    }
    if(minutes>0) {
      duration+="${duration.isNotEmpty ? " " : ""}$minutes Minute${minutes>1 ? "s" : ""}";
    }
    if(remainingSeconds>0) {
      duration+="${duration.isNotEmpty ? " " : ""}$remainingSeconds Second${remainingSeconds>1 ? "s" : ""}";
    }
    return duration;
  }

  static String getDTByStatus(SessionHistoryModel sessionHistory) {
    print("sessionHistory.status");
    print(sessionHistory.status);
    print(sessionHistory.id);
    print(Essential.getDate(sessionHistory.requested_at));
    print("sessionHistory.statusssss");
    if(sessionHistory.status=="ACTIVE" || sessionHistory.status=="COMPLETED") {
      return sessionHistory.started_at??"";
    }
    else if(sessionHistory.status=="WAITLISTED") {
      return sessionHistory.waitlisted_at??"";
    }
    else if(sessionHistory.status=="CANCELLED") {
      return sessionHistory.cancelled_at??"";
    }
    return sessionHistory.requested_at;
  }

  static Widget getNoDataWidget(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/common/no_data.png",
            height: 240,
            width: 240,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Uh-Oh!",
            style: GoogleFonts.manrope(
              fontSize: 22.0,
              color: MyColors.black,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 14.0,
              color: MyColors.colorGrey,
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  static ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}