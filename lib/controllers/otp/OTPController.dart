import 'dart:async';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:pinput/pinput.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;


class OTPController extends GetxController {

  OTPController();

  TextEditingController otp = TextEditingController();


  late Timer timer;
  late int start_time = 60;
  late String mobile;
  late String code;

  late String generatedOTP;

  late String verificationIDReceived;

  late FirebaseAuth auth;

  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  late String instance_id;
  late String access_token;
  late int whatsapp;
  late bool sms;

  @override
  void onInit() {
    super.onInit();
    sms = true;
    auth = FirebaseAuth.instance;
    generatedOTP = "";
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColors.colorButton),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: MyColors.colorLightPrimary,
      ),
    );

    mobile = Get.arguments['mobile'];
    code = Get.arguments['code'];
    instance_id = Get.arguments['instance_id'];
    access_token = Get.arguments['access_token'];
    whatsapp = Get.arguments['whatsapp'];
    start_time = 60;
    startTimer();

    getOTP("OTP Sent");
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec, (Timer timer) {
      if (start_time == 0) {
        timer.cancel();
      } else {
        start_time--;
      }
      update();
    },
    );
  }

  getOTP(String message) async {
    if(sms) {
      await auth.verifyPhoneNumber(
        phoneNumber: '$code$mobile',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("completed");
          print(credential);
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          verificationIDReceived = verificationId;
          Essential.showSnackBar(message, time: 1);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("timeout");
          print(verificationId);
          verificationIDReceived = verificationId;
          update();
        },
        verificationFailed: (FirebaseAuthException error) {
          print("failedddd");
          print(error);
        },
      );
    }
    else {
      getOTPByWhatsapp(message);
    }
  }

  void resendOTP() {
    print("hello");
    start_time = 60;
    update();
    startTimer();
    print("hhhh");
    getOTP("OTP Resent");
  }

  Future<String?> checkOTP(String otp) async {
    if(sms) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationIDReceived, smsCode: otp);
      try {
        await auth.signInWithCredential(credential).then((value) {
          print(value);
          if (value.user != null) {
            Get.back(result: "verified");
            return null;
          }
          else {
            Essential.showSnackBar("Invalid OTP", time: 1);
            return "Invalid OTP";
            // Get.snackbar("", "Invalid OTP", snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: MyColors.black,
            //     margin: EdgeInsets.all(5),
            //     colorText: MyColors.white);
          }
        });
      } catch (e1) {
        print(e1.toString());
        Essential.showSnackBar("Invalid Code", time: 1);
        // Get.snackbar("", "Invalid Code", snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: MyColors.black,
        //     margin: EdgeInsets.all(5),
        //     colorText: MyColors.white);
        return "Invalid Code";
      }
    }
    else {
      if(otp==generatedOTP) {
        Get.back(result: "verified");
        return null;
      }
      else {
        Essential.showSnackBar("Invalid OTP", time: 1);
        return "Invalid OTP";
      }
    }
  }

  Future<void> getOTPByWhatsapp(String message) async {
    generatedOTP = generateOTP(6);
    update();
    String text = 'Your AstroGuide Application OTP is *${generatedOTP}* Kindly login with this OTP.\nPlease keep it confidential.\n*Thank you*.';
    String url = 'https://auto.merabatuva.in/api/send?number=${code.substring(1)}${mobile}&type=media&message=${Uri.encodeComponent(text)}&instance_id=${instance_id}&access_token=${access_token}';
    print(url);
    var res = await http.get(Uri.parse(url));print(res);
    print(res.body);
    Essential.showSnackBar(message);

  }

  String generateOTP(int length) {
    // Define the characters allowed in the OTP
    const chars = '1234567890';

    // Create a random number generator object
    final math.Random rnd = math.Random();

    // Generate a string of random characters with the desired length
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  void changeType() {
    sms = !sms;
    update();
    getOTP("OTP Sent");
  }

}