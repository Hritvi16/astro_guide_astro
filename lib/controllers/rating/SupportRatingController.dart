import 'package:astro_guide_astro/cache_manager/CacheManager.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/constants/SupportConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/models/support/SupportModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/providers/SupportProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/repositories/SupportRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportRatingController extends GetxController {
  SupportRatingController();

  late SupportModel support;
  late TextEditingController review;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool validate() {
    return (support.rating??0)>0;
  }

  void manageRating() {
    final SupportRepository supportRepository = Get.put(SupportRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final SupportProvider supportProvider = Get.put(SupportProvider(supportRepository));

    Map <String, dynamic> data = {
      SupportConstants.sup_id : support.id,
      SupportConstants.rating : support.rating,
      SupportConstants.review : review.text.trim(),
    };

    supportProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      if(response.code==1) {
        back(result: support.copyWith(review: review.text.trim()));
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }


  void back({result}) {
    Get.back(result: result);
  }


  void updateRating(double rating) {
    support = support.copyWith(rating: rating);
    update();
  }
}
