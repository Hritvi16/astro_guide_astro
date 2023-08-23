import 'dart:async';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FollowingController extends GetxController {
  FollowingController();

  final storage = GetStorage();
  final UserProvider userProvider = Get.find();

  List<UserModel> users = [];

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;

  @override
  void onInit() {
    super.onInit();
    print("init");
    start();
  }

  start() {
    getUsers();
  }

  Future<void> getUsers() async {
    await userProvider.fetchByID(storage.read("access"), ApiConstants.followAPI).then((response) async {
      if(response.code==1) {
        users = [];
        users.addAll(response.data??[]);
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getUsers();
  }

  void onLoading() async{
  }

  void startTimer() {
    if(countdownTimer!=null) {
      stopTimer();
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      getUsers();
      stopTimer();
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }
}
