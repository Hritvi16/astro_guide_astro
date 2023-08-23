import 'package:astro_guide_astro/controllers/mySkill/MySkillController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MySkill extends StatelessWidget {
  MySkill({ Key? key }) : super(key: key);

  final MySkillController mySkillController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MySkillController>(
      builder: (controller) {
        return mySkillController.load ?
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
                child: CustomAppBar("My Skills".tr),
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
                                "Primary",
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
                                "Secondary",
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
                  itemCount: mySkillController.types.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return getTypesDesign(index, mySkillController.types[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getTypesDesign(int index, TypeModel type) {
    return
      Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Text(
                    type.type,
                    style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.labelColor(),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  if(type.load==true)
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
                ignoring: type.load==true,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Checkbox(
                        value: mySkillController.getValue(type, "PRIMARY"),
                        // groupValue: mySkillController.getGroupValue(type),
                        activeColor: type.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                        // fillColor: type.load==true ? MaterialStateProperty.all(MyColors.grad_yellow_1) : null,
                        onChanged: (value) {
                          if(value==true || (value==false && mySkillController.validate())) {
                            mySkillController.changeTypes(index, type, "PRIMARY", value ?? false);
                          }
                          else {
                            Essential.showSnackBar("You must have atleast one primary skill");
                          }
                        },
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Checkbox(
                        value: mySkillController.getValue(type, "SECONDARY"),
                        activeColor: type.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                        // fillColor: type.load==true ? MaterialStateProperty.all(MyColors.grad_yellow_1) : null,
                        // groupValue: mySkillController.getGroupValue(type),
                        onChanged: (value) {
                          mySkillController.changeTypes(index, type, "SECONDARY", value??false);
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