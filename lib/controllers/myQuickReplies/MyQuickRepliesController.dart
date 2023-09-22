import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/dialogs/ConfirmImagesDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/gallery/GalleryModel.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/views/home/settings/ManageQuickReplies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class MyQuickRepliesController extends GetxController {
  MyQuickRepliesController();

  final storage = GetStorage();

  late List<QuickRepliesModel> replies;

  late ChatProvider chatProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    replies = [];
    start();
    super.onInit();
  }

  start() {
    getMyQuickReplies();
  }

  Future<void> getMyQuickReplies() async {
    print(storage.read("access"));
    chatProvider.fetchQuickReplies(storage.read("access"), ApiConstants.quickReplies+ApiConstants.fetch).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        replies = [];
        replies.addAll(response.data ?? []);
      }
      load = true;
      update();
    });
  }


  void updateStatus(int index, int status, QuickRepliesModel temp) {
    final Map<String, dynamic> data = {
      CommonConstants.id : replies[index].id,
      CommonConstants.status : status,
    };

    replies[index] = replies[index].copyWith(load: false);
    update();

    chatProvider.manage(storage.read("access"), ApiConstants.quickReplies+ApiConstants.statuss, data).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        replies[index] = replies[index].copyWith(load: false);
        Essential.showSnackBar(status==1 ? "Status Activated" : "Status Deactivated");
      }
      else {
        replies[index] = temp.copyWith(
          load: false
        );
      }
      update();
    });
  }

  void delete(int index, ) {
    replies[index] = replies[index].copyWith(load: false);
    update();

    chatProvider.delete(storage.read("access"), ApiConstants.quickReplies+ApiConstants.delete+replies[index].id.toString()).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        replies.removeAt(index);
        update();
      }
      Essential.showSnackBar(response.message);
    });
  }

  Future<void> manage(QuickRepliesModel? quickReply) async {
    Get.bottomSheet(
        isScrollControlled: true,
        ManageQuickReplies(quickReply: quickReply,)
    ).then((value) {
      print(value);

      if(value==true) {
        load = false;
        update();
        getMyQuickReplies();
      }
    });
  }

  void confirmDelete(int index) {
    Get.dialog(
      BasicDialog(
        text: "Are you sure you want to delete this quick reply?",
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
    QuickRepliesModel temp = replies[index];

    replies[index] = replies[index].copyWith(
      status: value ? 1 : 0,
      load: true
    );
    update();

    await Future.delayed(Duration(seconds: 3), () {
      updateStatus(index, value ? 1 : 0, temp);
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getMyQuickReplies();
  }

  void onLoading() async{
  }
}