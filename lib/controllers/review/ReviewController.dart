import 'dart:async';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/dialogs/RatingDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReviewController extends GetxController {
  ReviewController();

  final storage = GetStorage();
  final AstrologerProvider astrologerProvider = Get.find();
  final ChatProvider chatProvider = Get.find();

  List<ReviewModel> reviews = [];

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;
  late bool free;
  late double wallet;

  @override
  void onInit() {
    super.onInit();
    start();
  }

  start() {
    getReviews();
  }

  Future<void> getReviews() async {
    await astrologerProvider.fetchReviews(storage.read("access"), ApiConstants.reviewAPI).then((response) async {
      if(response.code==1) {
        reviews = [];
        reviews.addAll(response.data??[]);
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getReviews();
  }

  void onLoading() async{
  }

  void startTimer() {
    if(countdownTimer!=null) {
      stopTimer();
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      getReviews();
      stopTimer();
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void manageReply(int index, ReviewModel review) {
    Get.dialog(
      RatingDialog(
        review: review,
      ),
      barrierDismissible: true,
    ).then((value) {
      if(value!=null) {
        reviews[index] = value;
        update();
        Essential.showSnackBar("Thank you for your reply");
      }
    });
  }

  void confirmDelete(int index, ReviewModel review) {
    Get.dialog(
      const BasicDialog(
        text: "Are you sure you want to delete your rating?",
        btn1: "Yes",
        btn2: "No",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Yes") {
        deleteReply(index, review);
      }
    });
  }

  Future<void> deleteReply(int index, ReviewModel review) async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : review.id,
      SessionConstants.reply : null,
    };

    print(data);

    await chatProvider.manage(storage.read("access"), ApiConstants.rating, data).then((response) async {
      if(response.code==1) {
        reviews[index] = reviews[index].copyWith(reply: null, replied_at: null);
        update();
        Essential.showSnackBar("Review Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

}
