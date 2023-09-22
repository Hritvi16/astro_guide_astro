import 'dart:async';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/WalletConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/models/wallet/WalletModel.dart';
import 'package:astro_guide_astro/providers/PackageProvider.dart';
import 'package:astro_guide_astro/providers/WalletProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WalletController extends GetxController {
  WalletController();

  final storage = GetStorage();
  final WalletProvider walletProvider = Get.find();

  late WalletModel wallet;
  late double balance;
  late bool load;




  @override
  void onInit() {
    super.onInit();
    balance = 0;
    load = false;
    start();
  }

  start() {
    getWallet();
  }

  Future<void> getWallet() async {
    await walletProvider.fetch(storage.read("access"), ApiConstants.astrologer).then((response) async {
      if(response.code==1) {
        balance = response.amount??0;
        wallet = response.data!;
      }
      load = true;
      update();
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getWallet();
  }

  void onLoading() async{
  }
}
