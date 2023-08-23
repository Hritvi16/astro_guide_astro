import 'dart:io';

import 'package:astro_guide_astro/cache_manager/CacheManager.dart';
import 'package:astro_guide_astro/constants/AstrologerConstants.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmImagesController extends GetxController {
  ConfirmImagesController();


  late List<XFile> files;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    files = [];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool validate() {
    return files.isNotEmpty;
  }

  void uploadImages() {
    final AstrologerRepository astrologerRepository = Get.put(AstrologerRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final AstrologerProvider astrologerProvider = Get.put(AstrologerProvider(astrologerRepository));

    final FormData data = FormData({
      AstrologerConstants.images : getImages(),
    });

    print(data.files);

    astrologerProvider.add(storage.read("access"), ApiConstants.galleryAPI+ApiConstants.add, data).then((response) async {
      if(response.code==1) {
        back(result: true);
      }
      else {
        Essential.showSnackBar("Please, try again later");
      }
    });
  }

  List<MultipartFile> getImages() {
    List<MultipartFile> images = [];
    for (var element in files) {
      images.add(MultipartFile(File(element.path), filename: element.name));
    }
    return images;
  }

  void back({result}) {
    Get.back(result: result);
  }

  void removeImage(int index) {
    files.removeAt(index);
    update();
  }
}
