import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/controllers/following/FollowingController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Following extends StatelessWidget {
  Following({ Key? key }) : super(key: key);

  final FollowingController followingController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<FollowingController>(
      builder: (controller) {
        return Scaffold(
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
                child: CustomAppBar('Following'.tr)
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: followingController.onRefresh,
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
              child: followingController.users.isNotEmpty ? SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child:
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
                  itemCount: followingController.users.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: standardVerticalGap,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getUserDesign(index, followingController.users[index]);
                  },
                )
              ) : Center(
                child: Text(
                  "You have not been followed by any user",
                  style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getUserDesign(int index, UserModel user) {
    return GestureDetector(
      onTap: () {
        followingController.goto("/userDetail", arguments: user.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        height: standardListCardHeight,
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.colorGrey,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getLeftSection(user),
            SizedBox(
              width: 10,
            ),
            getRightSection(index, user),
          ],
        ),
      ),
    );
  }

  Widget getLeftSection(UserModel user) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: MyColors.colorButton,
            width: 2
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(standardImageRadius),
            topRight: Radius.circular(standardImageRadius)
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(standardImageRadius),
                topRight: Radius.circular(standardImageRadius)
            ),
            child: Image.network(
              ApiConstants.userUrl+(user.profile??""),
              height: 130,
              // height: standardAstroListImageH,
              width: 70,
              fit: BoxFit.fill,
              errorBuilder: (buildContext, object, stackTrace) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/sign_up/profile.png",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getRightSection(int index, UserModel user) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: GoogleFonts.playfairDisplay(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          getIconInfo("assets/sign_up/location.png", (user.city??"").isNotEmpty ? ("${user.city??""}, ${user.state??""}, ${user.country??""}").toTitleCase() : "-"),
          SizedBox(
            height: 2,
          ),
          Text(
            user.nationality_name??"-",
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget getIconInfo(String image, String info) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Image.asset(
            image,
            height: 12,
            color: MyColors.colorButton,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            info,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.manrope(
              fontSize: 12.0,
              color: MyColors.colorGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

