import 'package:astro_guide_astro/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide_astro/views/home/dashboard/Dashboard.dart';
import 'package:astro_guide_astro/views/home/history/History.dart';
import 'package:astro_guide_astro/views/home/settings/Setting.dart';
import 'package:astro_guide_astro/views/home/support/Support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  HomeController();

  final storage = GetStorage();
  int current = 0;
  int size = 4;
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
    Dashboard(),
    Support(),
    History(),
    Setting(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
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

}
