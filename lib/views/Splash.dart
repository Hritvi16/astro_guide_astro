import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/splash/SplashController.dart';
import 'package:astro_guide_astro/size/MySize.dart';

class Splash extends StatelessWidget {
  Splash({ Key? key }) : super(key: key);

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: const Center(
        child: Text(
          "AstroGuide"
        ),
      ),
    );
  }
}