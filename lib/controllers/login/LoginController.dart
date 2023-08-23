
import 'dart:io';

import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/UserConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/login/LoginModel.dart';
import 'package:astro_guide_astro/notification_helper/NotificationHelper.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class LoginController extends GetxController {
  LoginController();

  final storage = GetStorage();

  final TextEditingController mobile = TextEditingController(text: "7228988032");
  final FocusNode phoneNumberFocusNode = FocusNode();

  late AstrologerProvider astrologerProvider = Get.find();

  @override
  void onInit() {
    // taketo();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  goto(String path, dynamic data, {LoginModel? loginModel}) {
    print(path);
    Get.toNamed(path, arguments: data)?.then((value) {
      if(value=="verified") {
        login();
        // goToHome(loginModel!);
      }
    });
  }

  Future<File> download(String url) async {
    final response = await http.get(Uri.parse(url));

    // Get the image name
    final imageName = path.basename(url);
    // Get the document directory path
    final appDir = await getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, imageName);

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);
    return imageFile;
  }


  Future<void> verify() async {
    final Map<String, String> data = {
      UserConstants.mobile : mobile.text,
    };

    print(data);

    astrologerProvider.login(data, CommonConstants.essential, ApiConstants.verify).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/otp", {"mobile" : mobile.text, "code" : "+91"}, loginModel: response);
        // goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> login() async {
    final Map<String, String> data = {
      UserConstants.mobile : mobile.text,
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    };

    print(data);

    astrologerProvider.login(data, CommonConstants.essential, ApiConstants.login).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        // goto("/otp", {"mobile" : mobile.text, "code" : "+91"}, loginModel: response);
        goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void goToHome(LoginModel response) {
    storage.write("access", response.access_token);
    storage.write("refresh", response.refresh_token);
    storage.write("status", "logged in");
    Get.offAllNamed("/home");
  }

}
