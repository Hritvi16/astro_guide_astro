import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/main.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide_astro/views/home/dashboard/Dashboard.dart';
import 'package:astro_guide_astro/views/home/history/History.dart';
import 'package:astro_guide_astro/views/home/settings/Setting.dart';
import 'package:astro_guide_astro/views/home/support/Support.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  HomeController();

  late AstrologerProvider astrologerProvider = Get.find();

  final storage = GetStorage();
  int current = 0;
  int size = 4;

  late bool load;
  late bool verify;

  List<BottomNavItem> items = [
    BottomNavItem(
      icon: "assets/dashboard/home"
    ),
    BottomNavItem(
      icon: "assets/dashboard/support"
    ),
    BottomNavItem(
      icon: "assets/dashboard/history"
    ),
    BottomNavItem(
      icon: "assets/dashboard/settings"
    ),
  ];

  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];



  @override
  void onInit() {
    load = false;
    verify = false;
    check();
    // initializeService();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> check() async {
    astrologerProvider.check(storage.read("access"), ApiConstants.check).then((response) async {
      print(response.toJson());
      load = true;
      if(response.code==1) {
        screens = [
          Dashboard(),
          Support(),
          History(),
          Setting(),
        ];
        verify = true;
      }
      update();
      // else {
      //   Essential.showSnackBar(response.message);
      // }
    });
  }


  void changeTab(int index) {
    current = index;
    update();
    if(current==0) {
      Dashboard().dashboardController.onInit();
    }
    else if(current==1) {
      Support().supportController.onInit();
    }
    else if(current==2) {
      History().historyController.onInit();
    }
    else if(current==3) {
      Setting().settingController.onInit();
    }
  }


  Future<void> logout() async {
    Essential.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));

    await astrologerProvider.settings(storage.read("access"), ApiConstants.logout).then((response) async {
      print(response.toJson());
      Get.back();
      if(response.code==1) {
        storage.write("access", "essential");
        storage.write("refresh", "");
        storage.write("status", "logged out");
        Get.offAllNamed("/login");
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }
}
