
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
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      // login();
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
      print(response.code==1 || response.code==0);
      if(response.code==1 || response.code==0) {
        Get.back();
        goto("/otp", {"mobile" : mobile.text, "code" : country.code, "whatsapp_url" : response.whatsapp_url,  "instance_id" : response.refresh_token, "access_token" : response.access_token, "whatsapp" : response.whatsapp}, loginModel: response);
        // goto("/signUp", {"mobile" : mobile.text, "code" : country.code, "instance_id" : response.refresh_token, "access_token" : response.access_token, "whatsapp" : response.whatsapp}, loginModel: response);
        // goToHome(response);
      }
      else {
        Essential.showSnackBar(response.message);
      }
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

  Future<void> loginWithGoogle() async {
    try {
      print("googleUser11");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print("googleUser");
      print(googleUser);
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        print(googleUser);

        loginWithSocial(googleUser);
        // Use the `credential` to authenticate with Firebase or your backend server
      }
    } on PlatformException catch (error) {
      print("PlatformException error");
      print(error);
      print(error.code);
      print(error.message);
      print(error.stacktrace);
      print(error.details);
    }
    catch (error) {
      print("error");
      print(error);
    }
  }


  Future<void> loginWithSocial(GoogleSignInAccount googleUser) async {
    print(googleUser);
    final Map<String, String> data = {
      UserConstants.email : googleUser.email,
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    };

    print(data);
    print(storage.read("access"));

    astrologerProvider.login(data, storage.read("access"), ApiConstants.socialLogin).then((response) async {
      print(response.toJson());
      if(response.code==-3) {
        Essential.showSnackBar(response.message, code: response.code, time: 3);
      }
      else {
        if (response.code == 1) {
          goToHome(response);
        }
        else  {
          File? image;
          if((googleUser.photoUrl??"").isNotEmpty) {
            image = await download(googleUser.photoUrl ?? "");
          }
          // register(googleUser.displayName ?? "", googleUser.email, UserConstants.jv['G']!, image);
        }
      }
    });
  }


  Future<void> goToHome(LoginModel response) async {
    storage.write("access", response.access_token);
    storage.write("refresh", response.refresh_token);
    storage.write("status", "logged in");

    await NotificationHelper.initializeSocket();

    print('storage.read("access")');
    print(storage.read("access"));
    // Get.offAllNamed("/home");
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
