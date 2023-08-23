
import 'package:astro_guide_astro/controllers/rating/RatingController.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';


class RatingDialog extends StatelessWidget {

  RatingDialog({Key? key, required ReviewModel review}) {
    ratingController.review = review;
    ratingController.reply = TextEditingController(text: review.reply??"");
  }

  final RatingController ratingController = Get.put<RatingController>(RatingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatingController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        ratingController.back();
                      },
                      child: Image.asset(
                        "assets/common/close.png",
                        color: MyColors.colorInfoGrey,
                        height: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    ratingController.review.user??"",
                    style: GoogleFonts.manrope(
                        fontSize: 16,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: MyColors.colorButton,
                    child: (ratingController.review.user_profile??"").isEmpty ?
                    CircleAvatar(
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/sign_up/profile.png",
                          color: MyColors.black,
                        ),
                      ),
                    )
                    : CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          ApiConstants.userUrl+(ratingController.review.user_profile??""),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: MyColors.colorButton,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            ApiConstants.astrologerUrl+(ratingController.review.astro_profile??"")
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 5),
                        child: Text(
                          ratingController.review.astrologer??"",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: MyColors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: standardTFLabel(text: 'Reply', optional: '\t(Optional)', optionalFontSize: 11,)
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      onChanged: (value) {
                        ratingController.update();
                      },
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.black,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: ratingController.reply,
                      maxLength: 300,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.colorButton,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Reply to this review",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(ratingController.reply.text.isNotEmpty) {
                        ratingController.manageRating();
                      }
                    },
                    child: standardButton(
                      context: context,
                      height: 40,
                      backgroundColor: ratingController.validate() ? MyColors.colorButton : MyColors.colorLightExpired,
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SUBMIT',
                            style: GoogleFonts.manrope(
                              fontSize: 16.0,
                              color: ratingController.validate() ? MyColors.white : MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
