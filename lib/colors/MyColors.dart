import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyColors
{
  // static Color colorPrimary = Color(0xffe3071d);

  static Color colorDarkPrimary = Color(0xfff3d12b);
  static Color colorPrimary = Color(0xffF7D947);
  static Color colorLightPrimary = Color(0xffFDF9C7);



  static Color colorActionEnabledBG = Color(0xffffffff);
  static Color colorActionDisabledBG = Color(0xff363637);
  static Color colorActionEnabled = Color(0xff000000);
  static Color colorActionDisabled = Color(0xffffffff);
  static Color colorActionBG = Color(0xff1d1d1d);


  static Color colorWalletBG = Color(0xffFEFDE8);

  static Color colorBlueBorder = Color(0xff93C5FD);
  static Color colorBlueBG = Color(0xffDBEAFE);

  static Color colorBG = Color(0xffF4F4F5);
  static Color colorButton = Color(0xffF4C23E);
  static Color colorDivider = Color(0xffD4D4D8);
  static Color colorBorder = Color(0xffD4D4D8);
  static Color colorBorderDark = Color(0x1F5B5B5B);
  static Color colorPCBorder = Color(0xffE4E4E7);
  static Color colorPSigns = Color(0xffbbbbbe);
  static Color colorAstroBG = Color(0xff18181B);

  static Color colorOrange = Color(0xffEC8526);
  static Color colorGrey = Color(0xffA1A1AA);
  static Color colorSuccess = Color(0xff22C55E);
  static Color colorError = Color(0xffEF4444);
  static Color colorLocation = Color(0xffEF4444);
  static Color colorSuccessDark = Color(0xff16A34A);
  static Color colorChat = Color(0xff3B82F6);
  static Color colorInfoBlue = Color(0xff2563EB);
  static Color colorInfoGrey = Color(0xff71717A);


  static Color colorOn = Color(0xff33c634);
  static Color colorOff = Color(0xfffb1c27);



  static Color colorFacebook = Color(0xff1877F2);

  static Color colorDarkSecondary = Color(0xff0a1554);
  static Color colorSecondary = Color(0xff283891);
  static Color colorLightSecondary = Color(0xff5263bf);

  static Color colorDarkExpired = Color(0xff48484a);
  static Color colorExpired = Color(0xffa3a4a8);
  static Color colorLightExpired = Color(0xffcecfd1);

  static Color colorDarkInactive = Color(0xff520606);
  static Color colorInactive = Color(0xffa61010);
  static Color colorLightInactive = Color(0xffff8888);
  // static Color colorPrimary = Color(0xff1d0b54);

  static Color colorUnrated = Color(0xff9e9e9e);

  static Color grey1 = Color(0xffefefef);
  static Color grey10 = Color(0xffe6e6e6);
  static Color grey30 = Color(0xff909090);
  static Color grey60 = Color(0xff666666);
  static Color grey80 = Color(0xff37474F);
  static Color grey90 = Color(0xff263238);


  static Color red300 = Color(0xffE57373);
  static Color red500 = Color(0xffF44336);
  static Color red600 = Color(0xffd00808);
  static Color red700 = Color(0xffD32F2F);
  static Color red800 = Color(0xffC62828);


  static Color blue = Color(0xff3ca0ff);
  static Color blue300 = Color(0xff64B5F6);
  static Color blue800 = Color(0xff1565C0);
  static Color blue900 = Color(0xff0D47A1);


  // static Color colorPrimaryLight = Color(0x56832343);


  static Color pink600 = Color(0xffD81B60);
  static Color pink800 = Color(0xffAD1457);


  static Color green300 = Color(0xff81C784);
  static Color green400 = Color(0xff66BB6A);
  static Color green500 = Color(0xff4CAF50);
  static Color green600 = Color(0xff43A047);
  static Color green800 = Color(0xff2E7D32);


  static Color purple100 = Color(0xff655787);
  static Color purple500 = Colors.purple;


  static Color yellow300 = Color(0xffFFF176);
  static Color yellow800 = Color(0xffffc945);
  static Color yellow900 = Color(0xfffdc12b);


  static Color colorAccent = Color(0xff02a55a);
  static Color colorInfo = Color(0xffa9a8ac);
  static Color white = Color(0xffffffff);
  static Color black = Color(0xff000000);
  static Color blackM = Color(0xff1a1b1d);
  static Color black11 = Color.fromRGBO(0, 0, 0, 0.4);
  static Color black12 = Color(0x1F000000);
  static Color red = Colors.red;
  static Color orange = Colors.orange;
  static Color red_d = Color(0xffFF0101);
  static Color grey = Color(0xff545252);
  static Color grey_2 = Color(0xff636060);
  static Color lightGrey = Color(0xffE9E8E8);
  static Color Profile_Grey = Color(0xfffafafa);

  static Color receiverLColor = Color(0xffE4E4E7);
  static Color receiverDColor = Color(0xff2d2d2d);



  static Color gray50 = Color(0xffe9e9e9);
  static Color gray100 = Color(0xffbdbebe);
  static Color gray200 = Color(0xff929293);
  static Color gray300 = Color(0xff666667);
  static Color gray400 = Color(0xff505151);
  static Color gray500 = Color(0xff242526);
  static Color gray600 = Color(0xff202122);
  static Color gray700 = Color(0xff191a1b);
  static Color gray800 = Color(0xff121313);
  static Color gray900 = Color(0xff0e0f0f);


  static Color grad_grey_1 = Color(0xff929293);
  static Color grad_grey_2 = Color(0xff666667);
  static Color grad_grey_3 = Color(0xff505151);
  static Color grad_purple_1 = Color(0xff8654ea);
  static Color grad_purple_2 = Color(0xffa680ed);
  static Color grad_purple_3 = Color(0xffcbb1fc);
  static Color grad_pink_1 = Color(0xffea5473);
  static Color grad_pink_2 = Color(0xffed8096);
  static Color grad_pink_3 = Color(0xfffcb1bf);
  static Color grad_blue_1 = Color(0xff479cfb);
  static Color grad_blue_2 = Color(0xff72b2fc);
  static Color grad_blue_3 = Color(0xff9ac8fc);
  static Color grad_green_1 = Color(0xff6adab8);
  static Color grad_green_2 = Color(0xff6de0c5);
  static Color grad_green_3 = Color(0xffaff0e0);
  static Color grad_teal_1 = Color(0xff012e2e);
  static Color grad_teal_2 = Color(0xff044242);
  static Color grad_teal_3 = Color(0xff35b8b8);
  static Color grad_orange_1 = Color(0xffba3404);
  static Color grad_orange_2 = Color(0xffed551f);
  static Color grad_orange_3 = Color(0xfff5875f);
  static Color grad_yellow_1 = Color(0xffffc000);
  static Color grad_yellow_2 = Color(0xfff5b64e);
  static Color grad_yellow_3 = Color(0xfff8ca7c);
  static Color grad_red_1 = Color(0xffff0000);
  static Color grad_red_2 = Color(0xfff54e4e);
  static Color grad_red_3 = Color(0xfff87c7c);

  static Color st_yellow_1 = Color(0xffffcb74);
  static Color st_yellow_2 = Color(0xffffa336);



  static Color pastelPink = Color(0xfffdd4db);
  static Color pastelOrange = Color(0xffffdfc0);
  static Color pastelGreen = Color(0xffc0eade);
  static Color pastelBlue = Color(0xffb5e2f4);
  static Color pastelPurple = Color(0xffd1d5f9);
  static Color pastelYellow = Color(0xfff9e2af);


  static Color requested = Color(0xff2563EB);
  static Color waitlist = Color(0xffEC8526);
  static Color active = Color(0xffF4C23E);
  static Color completed = Color(0xff22C55E);
  static Color missed = Color(0xffdc0100);
  static Color rejected = Color(0xff8797a6);
  static Color cancelled = Color(0xff263238);
  static Color reconnect = Color(0xff621c8a);


  static Color personal = Color(0xfff3881e);
  static Color health = Color(0xffc02437);
  static Color profession = Color(0xfffec417);
  static Color emotions = Color(0xff08a24f);
  static Color travel = Color(0xff6a3499);
  static Color luck = Color(0xffd80c8f);


  static List<Color> pastels = [
    pastelGreen,
    pastelYellow,
    pastelPurple,
    pastelOrange,
    pastelBlue,
    pastelPink,
  ];

  static Color colorJan = Color(0xffbc2a95);
  static Color colorFeb = Color(0xff8c2195);
  static Color colorMar = Color(0xff5d1692);
  static Color colorApr = Color(0xff1453cb);
  static Color colorMay = Color(0xff4cb2c1);
  static Color colorJun = Color(0xff3f962a);
  static Color colorJul = Color(0xff7ec73c);
  static Color colorAug = Color(0xfffffe53);
  static Color colorSep = Color(0xfff9cd46);
  static Color colorOct = Color(0xfff29d38);
  static Color colorNov = Color(0xffee702e);
  static Color colorDec = Color(0xffeb3323);

  static List<Color> months = [
    colorJan,
    colorFeb,
    colorMar,
    colorApr,
    colorMay,
    colorJun,
    colorJul,
    colorAug,
    colorSep,
    colorOct,
    colorNov,
    colorDec,
  ];

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static Color getColorFromHex(String hex) {
    return Color(int.parse("0xff"+hex));
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  static List<Color> getRedGradient() {
    return [MyColors.grad_red_1, MyColors.grad_red_2, MyColors.grad_red_3];
  }

  static List<Color> getBlueGradient() {
    return [MyColors.grad_blue_1, MyColors.grad_blue_2, MyColors.grad_blue_3];
  }

  static List<Color> getGreenGradient() {
    return [MyColors.grad_green_1, MyColors.grad_green_2, MyColors.grad_green_3];
  }

  static List<Color> getOrangeGradient() {
    return [MyColors.grad_orange_1, MyColors.grad_orange_2, MyColors.grad_orange_3];
  }

  static List<Color> getYellowGradient() {
    return [MyColors.grad_yellow_1, MyColors.grad_yellow_2, MyColors.grad_yellow_3];
  }

  static getColorGradient(MaterialColor colors) {
    return [colors.shade200, colors.shade400, colors.shade900];
  }
  
  static Color backgroundColor() {
    return Get.isDarkMode ? black : white;
  }

  static Color cardColor() {
    return Get.isDarkMode ? blackM : white;
  }

  static Color labelColor() {
    return Get.isDarkMode ? white : black;
  }

  static Color iconColor() {
    return Get.isDarkMode ? white : black;
  }

  static Color inverseIconColor() {
    return Get.isDarkMode ? black : white;
  }

  static Color borderColor() {
    return Get.isDarkMode ? colorBorderDark : colorBorder;
  }

  static Color borderInverseColor() {
    return Get.isDarkMode ? colorBorder : colorBorderDark;
  }

  static Color selectedColor() {
    return Get.isDarkMode ? black : white;
  }

  static Color dividerColor() {
    return Get.isDarkMode ? blackM : colorBG;
  }

  static Color receiverColor() {
    return Get.isDarkMode ? receiverDColor : receiverLColor;
  }

  static Color statusColor(String status) {
    if(status=="REQUESTED") {
      return MyColors.requested;
    }
    else if(status=="ACTIVE") {
      return MyColors.active;
    }
    else if(status=="WAITLISTED") {
      return MyColors.waitlist;
    }
    else if(status=="CANCELLED") {
      return MyColors.cancelled;
    }
    else if(status=="MISSED") {
      return MyColors.missed;
    }
    else if(status=="REJECTED") {
      return MyColors.rejected;
    }
    else if(status=="COMPLETED") {
      return MyColors.completed;
    }
    else if(status=="RECONNECT") {
      return MyColors.reconnect;
    }
    return black;
  }

  static Color horoscopeColor(String title) {
    if(title=="personal") {
      return MyColors.personal;
    }
    else if(title=="health") {
      return MyColors.health;
    }
    else if(title=="profession") {
      return MyColors.profession;
    }
    else if(title=="emotions") {
      return MyColors.emotions;
    }
    else if(title=="travel") {
      return MyColors.travel;
    }
    else if(title=="luck") {
      return MyColors.luck;
    }
    return black;
  }

}