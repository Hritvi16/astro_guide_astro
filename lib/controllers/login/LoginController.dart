
import 'dart:io';

import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/UserConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/login/LoginModel.dart';
import 'package:astro_guide_astro/notification_helper/NotificationHelper.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/CountryProvider.dart';
import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/views/country/Country.dart';
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController mobile = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  late AstrologerProvider astrologerProvider = Get.find();
  late CountryProvider countryProvider = Get.find();
  late List<CountryModel> countries;
  late CountryModel country;

  @override
  void onInit() {
    // taketo();
    countries = [
      CountryModel(id: -1, name: "India", nationality: "Indian", icon: "assets/country/India.png", code: "+91", imageFullUrl: "assets/country/India.png")
    ];
    country = countries.first;
    getCountries();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void getCountries() {
    countryProvider.fetchList(storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        countries = response.data??[];
        for (var value in countries) {
          if(value.name.toUpperCase()=="INDIA") {
            country = value;
            break;
          }
        }
        update();
      }
    });
  }


  goto(String path, dynamic data, {LoginModel? loginModel}) {
    print(path);
    Get.toNamed(path, arguments: data)?.then((value) {
      if(astrologerProvider==null) {
        astrologerProvider = Get.find();
        update();
      }
      update();
      if(value=="verified") {
        if(loginModel?.code==1) {
          login();
        }
        else {
          goto("/signUp", data);
        }
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

  void validate() {
    if(formKey.currentState!.validate()) {
      verify();
    }
  }

  Future<void> verify() async {
    Essential.showLoadingDialog();
    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+mobile.text,
    };

    print(data);

    astrologerProvider.login(data, CommonConstants.essential, ApiConstants.verify).then((response) async {
      print(response.toJson());
      // if(response.code==1) {
        Get.back();
        goto("/otp", {"mobile" : mobile.text, "code" : country.code}, loginModel: response);
        // goToHome(response);
      // }
      // else {
      //   Essential.showSnackBar(response.message);
      // }
    });
  }

  Future<void> login() async {
    Essential.showLoadingDialog();

    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+mobile.text,
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    };

    print(data);

    astrologerProvider.login(data, CommonConstants.essential, ApiConstants.login).then((response) async {
      print(response.toJson());
      Get.back();
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
    print('storage.read("access")');
    print(storage.read("access"));
    Get.offAllNamed("/home");
  }

  void changeCode() {
    Get.bottomSheet(
        isScrollControlled: true,
        Country(countries, country)
    ).then((value) {
      print(value);

      if(value!=null) {
        countries = value['countries'];
        country = value['country'];
        update();
      }
    });
  }

}
