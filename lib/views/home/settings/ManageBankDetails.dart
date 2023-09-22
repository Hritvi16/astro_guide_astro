import 'dart:io';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/myBank/ManageBankDetailsController.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageBankDetails extends StatelessWidget {
  ManageBankDetails({ Key? key }) : super(key: key);

  final ManageBankDetailsController manageBankDetailsController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<ManageBankDetailsController>(
      builder: (controller) {
        return manageBankDetailsController.load ?
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
                child: CustomAppBar("${manageBankDetailsController.action.toTitleCase()} Bank Details".tr),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: MySize.size100(context),
            height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/essential/bg.png")
                )
            ),
            child: SingleChildScrollView(
              child: Container(
                // height: 500,
                // padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24)
                  ),
                  child: Theme(
                    data: ThemeData(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: MyColors.colorButton,
                        ),
                        shadowColor: Colors.transparent,
                        canvasColor: MyColors.white
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: getCustomStepper(),
                    ),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getSteps() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(0, manageBankDetailsController.eval1),
        ),
        getConnector(0),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(1, manageBankDetailsController.eval2),
        ),
      ],
    );
  }

  Widget getStep(int step, int eval) {
    return step==manageBankDetailsController.current ?
    Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.white,
            border: Border.all(
                color: MyColors.colorButton
            )
        ),
        child: Container(
          height: 16,
          width: 16,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.colorButton
          ),
        )
    ) :
    eval==0 ?
    Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.colorButton
        ),
        child: Text(
          (step+1).toString(),
        )
    ) :
    eval==1 ? Icon(
      Icons.check_circle,
      color: MyColors.green500,
      size: 24,
    ) :
    Icon(
      Icons.warning,
      color: MyColors.red,
      size: 24,
    );
  }

  Widget getStepDesign(int step) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS, left: 10, right: 10),
      child: step==0 ? getStep1() : getStep2(),
    );
  }

  Widget getStep1() {
    return Form(
      key: manageBankDetailsController.step1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Bank Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: manageBankDetailsController.bank_name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors.colorButton,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "Enter Bank Name",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
          standardTFLabel(text: 'Branch', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: manageBankDetailsController.branch,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors.colorButton,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "Enter Branch",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
          standardTFLabel(text: 'Holder Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: manageBankDetailsController.holder_name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Holder Name",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getStep2() {
    return Form(
      key: manageBankDetailsController.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Account No', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: manageBankDetailsController.account_no,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Account No",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
          standardTFLabel(text: 'IFSC Code', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              maxLength: 11,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: manageBankDetailsController.ifsc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter IFSC Code",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  if((value??"").length<11) {
                    return "* Invalid";
                  }
                  return "* Required";
                }  else {
                  return null;
                }
              },
            ),
          ),
          standardTFLabel(text: 'Cheque Image', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          GestureDetector(
            onTap: () {
              manageBankDetailsController.chooseSource();
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 150,
              width: MySize.size100(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: MyColors.colorPrimary
                  )
              ),
              child: manageBankDetailsController.cheque!=null ?
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(manageBankDetailsController.cheque?.path ?? ""),
                  fit: BoxFit.fill,
                ),
              )
              : manageBankDetailsController.action==ApiConstants.update && manageBankDetailsController.bank.cheque.isNotEmpty ?
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  ApiConstants.bankUrl+manageBankDetailsController.bank.cheque,
                  fit: BoxFit.fill,
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: MyColors.colorGrey,
                    size: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Click to upload cheque image',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(manageBankDetailsController.error_c.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                manageBankDetailsController.error_c,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
        ],
      ),
    );
  }

  StepState getState(int step) {
    if(step==manageBankDetailsController.current) {
      return StepState.editing;
    }
    else if(step<manageBankDetailsController.current) {
      return StepState.complete;
    }
    else {
      return StepState.disabled;
    }
  }

  bool getActive(int step) {
    if(step==manageBankDetailsController.current) {
      return true;
    }
    else if(step<manageBankDetailsController.current) {
      return true;
    }
    else {
      return false;
    }
  }

  Widget getConnector(int step) {
    return step!=2 ? Text(
      "-------------",
      style: TextStyle(
          color: getColor(step)
      ),
    ) : Container();
  }

  Color getColor(int step) {
    if(step<manageBankDetailsController.current) {
      return MyColors.colorButton;
    }
    else {
      return MyColors.colorDivider;
      // return Colors.grey.shade400;
    }
  }

  Widget getCustomStepper() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: standardVTBS),
      child: Column(
        children: [
          getSteps(),
          getStepDesign(manageBankDetailsController.current),
          SizedBox(
            height: 20,
          ),
          getStepButton(manageBankDetailsController.current),
        ],
      ),
    );
  }

  Widget getStepButton(int current) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(manageBankDetailsController.current!=0)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: manageBankDetailsController.onStepCancel,
                child: standardButton(
                  context: context,
                  backgroundColor: MyColors.cardColor(),
                  borderColor: MyColors.borderColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/controls/arrow_previous.png",
                        height: standardArrowH,
                        width: standardArrowW,
                        // color: MyColors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: standardHTIS),
                        child: Text(
                          'Previous',
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            // color: MyColors.black,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          if(manageBankDetailsController.current!=0)
            SizedBox(
              width: standardHBBS,
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: manageBankDetailsController.onStepContinue,
              child: standardButton(
                context: context,
                backgroundColor: manageBankDetailsController.current==1
                    ? manageBankDetailsController.eval1==1
                    ? MyColors.colorButton
                    : MyColors.colorDivider
                    : MyColors.colorButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        manageBankDetailsController.current==0 ? "Continue" :manageBankDetailsController.action.toTitleCase(),
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color:  manageBankDetailsController.current==1
                              ? manageBankDetailsController.eval1==1
                              ? MyColors.white
                              : MyColors.black
                              : MyColors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/controls/arrow_next.png",
                      height: standardArrowH,
                      width: standardArrowW,
                      color:  manageBankDetailsController.current==1
                          ? manageBankDetailsController.eval1==1
                          ? MyColors.white
                          : MyColors.black
                          : MyColors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}