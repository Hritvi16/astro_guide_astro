import 'package:astro_guide_astro/controllers/mySpec/MySpecController.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
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

class MySpec extends StatelessWidget {
  MySpec({ Key? key }) : super(key: key);

  final MySpecController mySpecController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MySpecController>(
      builder: (controller) {
        return mySpecController.load ?
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
                child: CustomAppBar("My Specs".tr),
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
                        flex: 2,
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
                        child: Text(
                          "Manage",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              fontSize: 14.0,
                              color: MyColors.labelColor(),
                              fontWeight: FontWeight.w600
                          ),
                        )
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.labelColor(),
                ),
                ListView.separated(
                  itemCount: mySpecController.specs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return getSpecsDesign(index, mySpecController.specs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getSpecsDesign(int index, SpecModel spec) {
    return
      Row(
        children: [
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Text(
                    spec.spec,
                    style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.labelColor(),
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  if(spec.load==true)
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
                ignoring: spec.load==true,
                child: Checkbox(
                  value: mySpecController.getValue(spec),
                  activeColor: spec.load==true ? MyColors.colorButton.withOpacity(0.5) : MyColors.colorButton,
                  onChanged: (value) {
                    mySpecController.changeSpecs(index, spec, value??false);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              )
          )
        ],
      );
  }

}