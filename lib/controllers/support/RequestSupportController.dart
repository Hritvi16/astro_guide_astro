import 'dart:async';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/SupportConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/providers/SupportProvider.dart';
import 'package:astro_guide_astro/repositories/SupportRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RequestSupportController extends GetxController {
  RequestSupportController();

  final storage = GetStorage();

  late List<String> reasons;
  String? reason;

  late TextEditingController message;

  Timer? countdownTimer;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    print("init");

    reasons = CommonConstants.reasons;
    message = TextEditingController();
    reason = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeReason (String? value) {
    reason = value!;
    update();
  }
  
  Future<void> request() async {
    if(formKey.currentState!.validate()) {
      final SupportRepository supportRepository = Get.put(
          SupportRepository(Get.put(ApiService(Get.find()), permanent: true)));
      late SupportProvider supportProvider = Get.put(
          SupportProvider(supportRepository));

      Map<String, dynamic> data = {
        SupportConstants.reason: reason,
        SupportConstants.message: message.text,
      };
      print(message.text);

      await supportProvider.request(storage.read("access"), ApiConstants.request, data).then((response) async {
        print(response.toJson());
        if (response.code == 1) {
          back(result: response.id);
        }
        else {
          Essential.showSnackBar(response.message);
        }
      });
    }
  }

  void back({dynamic result}) {
    Get.back(result: result);
  }
}
