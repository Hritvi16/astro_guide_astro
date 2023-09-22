
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/controllers/wallet/WalletController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Wallet extends StatelessWidget {
  Wallet({ Key? key }) : super(key: key);

  final WalletController walletController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<WalletController>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: MyColors.white,
          body: walletController.load ? getBody(context) : LoadingScreen(),
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
              padding: EdgeInsets.symmetric(
                  horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('My Wallet'.tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: walletController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getMyAmountDesign(),
                    SizedBox(
                      height: 28,
                    ),
                    getOverallSummary(),
                    SizedBox(
                      height: 28,
                    ),
                    getSummary("Today's".tr, "${CommonConstants.rupee}${walletController.wallet.today_amount.toStringAsFixed(2)}", "${CommonConstants.rupee}${(walletController.wallet.today_amount-walletController.wallet.today_earning).toStringAsFixed(2)}", "${CommonConstants.rupee}${walletController.wallet.today_earning.toStringAsFixed(2)}"),
                    SizedBox(
                      height: 28,
                    ),
                    getSummary("Monthly".tr, "${CommonConstants.rupee}${walletController.wallet.monthly_amount.toStringAsFixed(2)}", "${CommonConstants.rupee}${(walletController.wallet.monthly_amount-walletController.wallet.monthly_earning).toStringAsFixed(2)}", "${CommonConstants.rupee}${walletController.wallet.monthly_earning.toStringAsFixed(2)}"),
                    SizedBox(
                      height: 28,
                    ),
                    getSummary("Yearly".tr, "${CommonConstants.rupee}${walletController.wallet.yearly_amount.toStringAsFixed(2)}", "${CommonConstants.rupee}${(walletController.wallet.yearly_amount-walletController.wallet.yearly_earning).toStringAsFixed(2)}", "${CommonConstants.rupee}${walletController.wallet.yearly_earning.toStringAsFixed(2)}"),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getMyAmountDesign() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          color: MyColors.colorLightPrimary,
          child: Image.asset(
            "assets/common/my_wallet.png",
            height: 30,
            width: 30,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Available Balance".tr,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${CommonConstants.rupee} ${walletController.balance%1==0 ? walletController.balance.toDouble().toString() : walletController.balance.toStringAsFixed(2)}",
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.colorGrey,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }


  Widget getInfoDesign(String title, String info) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            color: MyColors.colorPrimary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: MyColors.colorButton
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                title,
                style: GoogleFonts.manrope(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: MyColors.labelColor()
                )
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  info,
                  style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: MyColors.labelColor()
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getOverallSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getHeading("Overall Summary".tr),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
                child: getInfoDesign("Total Sales".tr, "${CommonConstants.rupee}${walletController.wallet.total.toStringAsFixed(2)}")
            ),
            SizedBox(
              width: standardHorizontalPagePadding,
            ),
            Flexible(
                child: getInfoDesign("Commission".tr, "${CommonConstants.rupee}${(walletController.wallet.total-walletController.wallet.earnings).toStringAsFixed(2)}")
            ),
          ],
        ),
        SizedBox(
          height: standardHorizontalPagePadding,
        ),
        Row(
          children: [
            Flexible(
                child: getInfoDesign("My Earnings".tr, "${CommonConstants.rupee}${walletController.wallet.earnings.toStringAsFixed(2)}")
            ),
            SizedBox(
              width: standardHorizontalPagePadding,
            ),
            Flexible(
                child: getInfoDesign("Paid".tr, "${CommonConstants.rupee}${walletController.wallet.paid.toStringAsFixed(2)}")
            ),
          ],
        ),
      ],
    );
  }

  Widget getSummary(String title, String total,  String commission,  String earnings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getHeading("${title} ${'Summary'.tr}"),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              child: getInfoDesign("Total Sales".tr, total)
            ),
            SizedBox(
              width: standardHorizontalPagePadding,
            ),
            Flexible(
              child: getInfoDesign("Commission".tr, commission)
            ),
          ],
        ),
        SizedBox(
          height: standardHorizontalPagePadding,
        ),

        Row(
          children: [
            Flexible(
              child: getInfoDesign("My Earnings".tr, earnings)
            ),
            SizedBox(
              width: standardHorizontalPagePadding,
            ),
            Flexible(
              child: SizedBox()
            ),
          ],
        ),

      ],
    );
  }

  Widget getHeading(String heading) {
    return Text(
      heading,
      style: GoogleFonts.manrope(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: MyColors.labelColor()
      )
    );
  }
}