import 'dart:async';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManageQuickRepliesController extends GetxController {
  ManageQuickRepliesController();

  final storage = GetStorage();

  QuickRepliesModel? quickReply;
  late TextEditingController reply;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    reply = TextEditingController(text: quickReply?.reply??"");
  }

  @override
  void dispose() {
    super.dispose();
  }

  
  Future<void> manage() async {
    if(formKey.currentState!.validate()) {
      final ChatRepository chatRepository = Get.put(
          ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
      late ChatProvider chatProvider = Get.put(
          ChatProvider(chatRepository));

      Map<String, dynamic> data = {
        if(quickReply!=null)
          "id": quickReply!.id,
        "reply": reply.text,
      };
      print(reply.text);

      await chatProvider.manage(storage.read("access"), ApiConstants.quickReplies+(quickReply==null ? ApiConstants.add : ApiConstants.update), data).then((response) async {
        print(response.toJson());
        if (response.code == 1) {
          back(result: true);
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
