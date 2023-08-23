import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/review/ReviewController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Review extends StatelessWidget {
  Review({ Key? key }) : super(key: key);

  final ReviewController reviewController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ReviewController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: getBody(context),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeight,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Review'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: reviewController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SizedBox(
              height: MySize.sizeh100(context) - standardUpperFixedDesignHeight - standardBottomBarHeight - standardVerticalGap,
              child: reviewController.reviews.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                  itemCount: reviewController.reviews.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: standardVerticalGap,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getReviewDesign(index, reviewController.reviews[index]);
                  },
                )
              ) : Container(
                height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "You have not been rated or reviewed by any user!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getReviewDesign(int index, ReviewModel review) {
    return GestureDetector(
      onTap: () {
        // reviewController.goto("/reviewDetail", arguments: review.id.toString());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.colorGrey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                Essential.getDateTime(review.reviewed_at),
                style: GoogleFonts.manrope(
                  fontSize: 10.0,
                  color: MyColors.colorGrey,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: "ORD: ",
                      style: GoogleFonts.manrope(
                        fontSize: 16.0,
                        color: MyColors.colorGrey,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: "#${review.order_id}",
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                            color: MyColors.colorButton,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]
                  ),
                ),
                GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: "#${review.order_id}"));
                    },
                    child: getIconInfo("assets/common/copy.png", "Copy", color: MyColors.colorGrey)
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getLeftSection(review),
                SizedBox(
                  width: 10,
                ),
                getRightSection(index, review),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getLeftSection(ReviewModel review) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: MyColors.colorButton,
      child: (review.user_profile??"").isEmpty ?
      CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            "assets/sign_up/profile.png",
            color: MyColors.black,
          ),
        ),
      )
          : CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            ApiConstants.userUrl+(review.user_profile??"")
        ),
      ),
    );
  }

  getRightSection(int index, ReviewModel review) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            review.anonymous==0 ? review.user??"Anonymous" : "Anonymous",
            style: GoogleFonts.playfairDisplay(
              fontSize: 18.0,
              color: MyColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          RichText(
            text: TextSpan(
                text: "SERVICE: ",
                style: GoogleFonts.manrope(
                  fontSize: 14.0,
                  color: MyColors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: review.category,
                    style: GoogleFonts.manrope(
                      fontSize: 14.0,
                      color: review.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]
            ),
          ),
          SizedBox(
            height: 5,
          ),
          showRatings(review.rating),
          SizedBox(
            height: 5,
          ),
          Text(
            review.review??"",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              color: MyColors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          if ((review.reply??"").isEmpty) GestureDetector(
            onTap: () {
              reviewController.manageReply(index, review);
            },
            child: getIconInfo("assets/common/reply.png", "Reply to this review", textColor: MyColors.colorButton, textSize: 14.0)
          ) else Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 1,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  Essential.getDateTime(review.replied_at??""),
                  style: GoogleFonts.manrope(
                    fontSize: 10.0,
                    color: MyColors.colorGrey,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                review.reply??"",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  fontSize: 12.0,
                  color: MyColors.black,
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      reviewController.manageReply(index, review);
                    },
                    child: Text(
                      "Edit",
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: MyColors.colorButton,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      reviewController.confirmDelete(index, review);
                    },
                    child: Text(
                      "Delete",
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: MyColors.colorInactive,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }


  Widget showRatings(double rating) {
    return RatingBar.builder(
      initialRating: rating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      ignoreGestures: true,
      itemSize: 16,
      itemBuilder: (context, _) => Image.asset(
        "assets/common/star.png",
        color: MyColors.colorButton,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }
}

