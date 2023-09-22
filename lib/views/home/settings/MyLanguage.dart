import 'package:astro_guide_astro/controllers/myLanguage/MyLanguageController.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyLanguage extends StatelessWidget {
  MyLanguage({ Key? key }) : super(key: key);

  final MyLanguageController myLanguageController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyLanguageController>(
      builder: (controller) {
        return myLanguageController.load ?
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: getBody(),
        )
            : LoadingScreen();
      },
    );
  }

  Widget getBody() {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar("My Language".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Name",
                          style: GoogleFonts.manrope(
                              fontSize: 14.0,
                              color: MyColors.labelColor(),
                              fontWeight: FontWeight.w600
                          ),
                        )
                    ),
                    Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "Write",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    color: MyColors.labelColor(),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "Speak",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    color: MyColors.labelColor(),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Text(
                                "Both",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                    fontSize: 14.0,
                                    color: MyColors.labelColor(),
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.labelColor(),
                ),
                ListView.separated(
                  itemCount: myLanguageController.langs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return getLangsDesign(index, myLanguageController.langs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getLangsDesign(int index, LanguageModel lang) {
    return
      Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Text(
                    lang.lang,
                    style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.labelColor(),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  if(lang.load==true)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: LoadingAnimationWidget.dotsTriangle(
                        color: MyColors.colorButton, size: 14
                      ),
                    )
                ],
              )
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: IgnorePointer(
                ignoring: lang.load==true,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Checkbox(
                        value: myLanguageController.getValue(lang, "WRITE"),
                        // groupValue: myLanguageController.getGroupValue(lang),
                        activeColor: lang.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                        // fillColor: lang.load==true ? MaterialStateProperty.all(MyColors.grad_yellow_1) : null,
                        onChanged: (value) {
                          myLanguageController.changeLangs(index, lang, "WRITE", value??false);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Checkbox(
                        value: myLanguageController.getValue(lang, "SPEAK"),
                        activeColor: lang.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                        // fillColor: lang.load==true ? MaterialStateProperty.all(MyColors.grad_yellow_1) : null,
                        // groupValue: myLanguageController.getGroupValue(lang),
                        onChanged: (value) {
                          myLanguageController.changeLangs(index, lang, "SPEAK", value??false);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Checkbox(
                        value: myLanguageController.getValue(lang, "BOTH"),
                        activeColor: lang.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                        // fillColor: lang.load==true ? MaterialStateProperty.all(MyColors.grad_yellow_1) : null,
                        // groupValue: myLanguageController.getGroupValue(lang),
                        onChanged: (value) {
                          myLanguageController.changeLangs(index, lang, "BOTH", value??false);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      );
  }
  
}