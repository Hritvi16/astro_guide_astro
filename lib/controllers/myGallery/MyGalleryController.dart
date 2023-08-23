import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/dialogs/ConfirmImagesDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/gallery/GalleryModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class MyGalleryController extends GetxController {
  MyGalleryController();

  final storage = GetStorage();

  late List<GalleryModel> galleries;
  late List<XFile> images;

  late AstrologerProvider astrologerProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    galleries = [];
    images = [];
    start();
    super.onInit();
  }

  start() {
    getMyGallery();
  }

  void getMyGallery() {
    print(storage.read("access"));
    astrologerProvider.fetchGallery(storage.read("access"), ApiConstants.galleryAPI).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        galleries = [];
        galleries.addAll(response.data ?? []);
      }
      load = true;
      update();
    });
  }


  void updateStatus(int index, int status, GalleryModel temp) {
    final Map<String, dynamic> data = {
      CommonConstants.id : galleries[index].id,
      CommonConstants.status : status,
    };

    galleries[index] = galleries[index].copyWith(load: false);
    update();

    astrologerProvider.updateStatus(storage.read("access"), ApiConstants.galleryAPI+ApiConstants.statuss, data).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        galleries[index] = galleries[index].copyWith(load: false);
        Essential.showSnackBar(status==1 ? "Status Activated" : "Status Deactivated");
      }
      else {
        galleries[index] = temp.copyWith(
          load: false
        );
      }
      update();
    });
  }

  void delete(int index, ) {
    galleries[index] = galleries[index].copyWith(load: false);
    update();

    astrologerProvider.delete(storage.read("access"), ApiConstants.galleryAPI+ApiConstants.delete+galleries[index].id.toString()).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        galleries.removeAt(index);
        update();
      }
      Essential.showSnackBar(response.message);
    });
  }

  Future<void> addImages() async {
    final ImagePicker picker = ImagePicker();
    int limit = 20 - galleries.length;

    if(limit>0) {
      List<XFile> file = await picker.pickMultiImage(imageQuality: 50,);
      if (file.isNotEmpty) {
        images.addAll(file.length <= limit ? file : file.sublist(0, limit));
        update();
        showImages();
      }
    }
  }

  void confirmDelete(int index) {
    Get.dialog(
      BasicDialog(
        text: "Are you sure you want to delete this picture from the gallery?",
        btn1 : "Yes",
        btn2: "No",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Yes") {
        delete(index);
      }
    });
  }

  void showImages() {
    if(images.isNotEmpty) {
      Get.dialog(
        ConfirmImagesDialog(
          text: "Are you sure you want to add these pictures in gallery?",
          btn1 : "Cancel",
          btn2: "Upload",
          files: images,
        ),
        barrierDismissible: false,
      ).then((value) {
        if(value==true) {
          load = false;
          update();
          getMyGallery();
        }
        else {
          images = [];
          update();
        }
      });
    }
  }

  String getApprovedStatus(int approved) {
    return approved==0 ? "Pending" : approved==1 ? "Approved" : "Rejected";
  }

  String getApprovedIcon(int approved) {
    return approved==0 ? "pending" : approved==1 ? "verify" : "reject";
  }

  Color? getApprovedColor(int approved) {
    return approved==0 ? null : approved==1 ? MyColors.colorSuccess : MyColors.colorInactive;
  }

  Future<void> toggleStatus(int index, bool value) async {
    GalleryModel temp = galleries[index];

    galleries[index] = galleries[index].copyWith(
      status: value ? 1 : 0,
      load: true
    );
    update();

    await Future.delayed(Duration(seconds: 3), () {
      updateStatus(index, value ? 1 : 0, temp);
    });
  }

}