import 'package:astro_guide_astro/cache_manager/CacheManager.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  RatingController();

  late ReviewModel review;
  late TextEditingController reply;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool validate() {
    return reply.text.trim().isNotEmpty;
  }

  void manageRating() {
    final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final ChatProvider chatProvider = Get.put(ChatProvider(chatRepository));

    Map <String, dynamic> data = {
      SessionConstants.ch_id : review.id,
      SessionConstants.reply : reply.text.trim(),
    };

    chatProvider.manage(storage.read("access"), ApiConstants.rating+ApiConstants.reply, data).then((response) async {
      if(response.code==1) {
        back(result: review.copyWith(reply: reply.text.trim()));
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }


  void back({result}) {
    Get.back(result: result);
  }
}
