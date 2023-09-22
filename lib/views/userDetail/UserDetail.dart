import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/userDetail/UserDetailController.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetail extends StatelessWidget {
  UserDetail({ Key? key }) : super(key: key);

  final UserDetailController userDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<UserDetailController>(
      builder: (controller) {
        return userDetailController.load ? Scaffold(
          // bottomNavigationBar: getBottomDesign(),
          body : getBody(context),
        ) : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          // color: MyColors.colorAstroBG,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              height: standardUpperFixedDesignHeight,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg_s.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('User Profile'.tr,),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: userDetailController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MySize.size100(context),
                        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getBasicDetails(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                thickness: 1.5,
                                color: MyColors.dividerColor(),
                              ),
                            ),
                            getNationality(),
                            getLocation(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Divider(
                                thickness: 1.5,
                                color: MyColors.dividerColor(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getImageDesign() {
    return GestureDetector(
      onTap: () {
        userDetailController.goto("/photoView", arguments: ApiConstants.userUrl+(userDetailController.user.profile??""));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          standardUserMImageRadius
        ),
        child: Image.network(
          ApiConstants.userUrl+(userDetailController.user.profile??""),
          height: standardUserMImageH,
          width: standardUserMImageW,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget getBoxDesign(String info) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: MyColors.colorLightPrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: MyColors.colorButton
          )
      ),
      child: Text(
        info,
        style: GoogleFonts.manrope(
          fontSize: 12.0,
          color: MyColors.black,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget getBasicDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getImageDesign(),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  userDetailController.user.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userDetailController.user.gender??"",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.colorGrey,
                fontWeight: FontWeight.w500,
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget getNationality() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nationality".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )
        ),
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorGrey,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if((userDetailController.user.nationality_icon??"").isNotEmpty)
                Image.network(
                  ApiConstants.countryUrl+(userDetailController.user.nationality_icon??""),
                  height: 18,
                ),
              Padding(
                padding: EdgeInsets.only(left: (userDetailController.user.nationality_icon??"").isNotEmpty ? 10.0 : 0),
                child: Text(
                  (userDetailController.user.nationality_name ?? "Not Provided").toTitleCase(),
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location".tr,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )
        ),
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.colorGrey,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/sign_up/location.png",
                height: 18,
                color: MyColors.colorLocation,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                (userDetailController.user.city??"").isNotEmpty ? ("${userDetailController.user.city??""}, ${userDetailController.user.state??""}, ${userDetailController.user.country??""}").toTitleCase() : "Not Provided",
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}