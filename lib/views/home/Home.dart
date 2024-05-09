import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/home/HomeController.dart';
import 'package:astro_guide_astro/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (controller) {
        return homeController.load ?
        WillPopScope(
          onWillPop: () async {
            if (homeController.current != 0) {
              homeController.changeTab(0);
              return false;
            }
            return true;
          },
          child: homeController.verify ?
          Scaffold(
            bottomNavigationBar: BottomNavigation(
              backgroundColor: MyColors.colorPrimary,
              current: homeController.current,
              size: homeController.size,
              items: homeController.items,
              controller : homeController
            ),
            body: homeController.screens[homeController.current]
          )
          : getInactiveScreen(context),
        )
        : LoadingScreen();
      },
    );
  }

  Widget getInactiveScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              // "assets/common/no_data.png",
              "assets/app_icon/icon2.png",
              height: 240,
              width: 240,
            ),
            SizedBox(
              height: 24,
            ),
            // Text(
            //   "Uh-Oh!".tr,
            //   style: GoogleFonts.manrope(
            //     fontSize: 22.0,
            //     color: MyColors.labelColor(),
            //     letterSpacing: 0,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
            // SizedBox(
            //   height: 4,
            // ),
            Text(
              // "Seems like you are inactive! Contact to admin!",
              "Thank you for registering.\nAstroGuide team will contact you soon.",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                // color: MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),

            GestureDetector(
              onTap: () {
                homeController.logout();
              },
              child: standardButton(
                context: context,
                backgroundColor: MyColors.colorButton,
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        'Logout',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   "assets/controls/arrow_next.png",
                    //   height: standardArrowH,
                    //   width: standardArrowW,
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}