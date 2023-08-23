import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/information/InformationController.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class Information extends StatelessWidget {
  Information({ Key? key }) : super(key: key);

  final InformationController informationController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<InformationController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.white,
          body: getBody(context),
        );
      },
    );
  }

  getBody(BuildContext context) {
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
                child: CustomAppBar(Get.arguments['title']),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SingleChildScrollView(
              child: HtmlWidget(informationController.unescape.convert(informationController.info)),
            ),
          ),
        ),
      ],
    );
  }
}