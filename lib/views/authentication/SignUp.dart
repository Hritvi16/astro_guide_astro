import 'dart:io';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:astro_guide_astro/constants/UserConstants.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/signUp/SignUpController.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../shared/widgets/button/Button.dart';

class SignUp extends StatelessWidget {
  SignUp({ Key? key }) : super(key: key);

  final SignUpController signUpController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return WillPopScope(
      onWillPop: () async {
        if(signUpController.verified==true) {
          if(signUpController.current==0) {
            signUpController.resetVerify();
            return false;
          }
          else {
            signUpController.onStepCancel();
            return false;
          }
        }
        else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: MyColors.colorPrimary,
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MySize.size100(context),
          height: MySize.sizeh100(context),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/essential/upper_bg.png"
                  )
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, bottom: 8),
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 32.0,
                                  color: MyColors.black,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'Create your account now',
                              style: GoogleFonts.manrope(
                                fontSize: 18.0,
                                color: MyColors.black11,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<SignUpController>(
                        builder: (controller) {
                          return Container(
                            // height: 500,
                            // padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: MyColors.white,
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
                                  child: signUpController.verified==false ? getInitialStep() : getCustomStepper(),
                                ),
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.black,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w600,
                            ),

                            recognizer: TapGestureRecognizer()..onTap = () {
                              Get.back();
                            }
                          )
                        ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getSteps() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(0, signUpController.eval1),
        ),
        getConnector(0),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(1, signUpController.eval2),
        ),
        getConnector(1),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(2, signUpController.eval3),
        ),
        getConnector(2),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(3, signUpController.eval4),
        ),
      ],
    );
  }

  Widget getStep(int step, int eval) {
    return Column(
      children: [
        step==signUpController.current ?
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
        ),
        Text(
          signUpController.getStepTitle(step),
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 9.0,
            color: MyColors.black,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }



  getStepDesign(int step) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS, left: 10, right: 10),
      child: step==0 ? getStep1() : step==1 ? getStep2() : step==2 ? getStep3() : getStep4(),
    );
  }

  getInitialStep() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: signUpController.step,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 25),
              child: Text(
                'Verify Mobile No.',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28.0,
                  color: MyColors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            standardTFLabel(text: 'Mobile Number', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: signUpController.mobile,
                style: GoogleFonts.manrope(
                  fontSize: 16.0,
                  color: MyColors.black,
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
                    hintText: "Enter Mobile No.",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    prefixIcon: GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Image.asset(
                              "assets/country/India.png",
                              height: 24,
                              width: 33,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              '+91',
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            color: MyColors.colorDivider,
                            width: 2,
                            height: 20,
                          )
                        ],
                      ),
                    )
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
            GestureDetector(
              onTap: () {
                signUpController.verified = true;
                signUpController.update();
                // signUpController.verify();
              },
              child: standardButton(
                context: context,
                backgroundColor: MyColors.colorButton,
                margin: const EdgeInsets.only(top: 24, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        'GET OTP',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: MyColors.white,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/controls/arrow_next.png",
                      height: standardArrowH,
                      width: standardArrowW,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getStep1() {
    print(signUpController.error_p.isNotEmpty);
    return Form(
      key: signUpController.step1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: MyColors.colorButton,
                  child: signUpController.image==null ?
                  CircleAvatar(
                    radius: 47,
                    child: Icon(
                      Icons.person,
                      color: MyColors.grey30,
                      size: 30,
                    ),
                    backgroundColor: MyColors.white,
                  ) :
                  CircleAvatar(
                    radius: 47,
                    backgroundImage: FileImage(File(signUpController.image?.path??""))
                  )
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      signUpController.chooseSource("P");
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.colorButton
                      ),
                      child: Image.asset(
                        "assets/sign_up/camera.png",
                        color: MyColors.white,
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if(signUpController.error_p.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                signUpController.error_p,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Full Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Full Name",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/profile.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  ),
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
          standardTFLabel(text: 'Email Address', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Email Address",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/email.png",
                      height: 10,
                      color: MyColors.colorButton,
                      // child: Image.asset(
                      //   "assets/sign_up/profile.png",
                      //   height: 15,
                      //   width: 10,
                      //   color: MyColors.colorButton,
                      // ),
                    ),
                  ),
              ),
              validator: (value) {
                if (value!.isNotEmpty) {
                  if (!EmailValidator.validate(value)) {
                    // Get.snackbar( "", "Enter valid email address", snackPosition: SnackPosition.BOTTOM,backgroundColor: MyColors.black, margin: EdgeInsets.all(5),  colorText: MyColors.white);
                    return "Enter valid email address";
                  }
                  else {
                    return null;
                  }
                }
                else {
                  return "* Required";
                }
              },
            ),
          ),
          standardTFLabel(text: 'Date of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onTap: () {
                BottomPicker.date(
                  title:  "Set your Date of Birth",
                  titleStyle: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.colorButton,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                  onSubmit: (value) {
                    signUpController.setDOB(value);
                  },
                  bottomPickerTheme:  BottomPickerTheme.plumPlate,
                  buttonText: "Done",
                  buttonTextStyle: GoogleFonts.manrope(
                    fontSize: 16.0,
                    color: MyColors.black,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                  buttonSingleColor: Colors.transparent,
                  displayButtonIcon: false,
                ).show(context);
              },
              controller: signUpController.dob,
              readOnly: true,
              keyboardType: TextInputType.datetime,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
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
                  hintText: "Enter Date of Birth",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/calendar.png",
                      height: 10,
                      color: MyColors.colorButton,
                      // child: Image.asset(
                      //   "assets/sign_up/profile.png",
                      //   height: 15,
                      //   width: 10,
                      //   color: MyColors.colorButton,
                      // ),
                    ),
                  )
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
          standardTFLabel(text: 'Gender', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                getGenderBox(UserConstants.M, "Male"),
                getGenderBox(UserConstants.F, "Female"),
                getGenderBox(UserConstants.O, "Other"),
              ],
            ),
          ),
          if(signUpController.error_g.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                signUpController.error_g,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'City', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<CityModel>(
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search City",
                      ),
                    )
                ),
                itemAsString: (CityModel city) => "${city.name}, ${city.state??""}, ${city.country??""}",
                items: signUpController.cities,
                selectedItem: signUpController.city,
                dropdownDecoratorProps:  DropDownDecoratorProps(
                    baseStyle: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                    dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.colorButton,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Enter City",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Image.asset(
                            "assets/sign_up/location.png",
                            height: 10,
                            color: MyColors.colorButton,
                          ),
                        )
                    )
                ),
                validator: (value) {
                  if (value==null) {
                    return "* Required";
                  }  else {
                    return null;
                  }
                },
                onChanged: (value) {
                  signUpController.changeCity(value);
                },
              )
          ),
        ],
      ),
    );
  }

  Widget getGenderBox(String value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: signUpController.gender,
          onChanged: (val) {
            signUpController.changeGender(value);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget getReferBox(bool value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: signUpController.refer,
          onChanged: (val) {
            signUpController.changeRefer(value);
          },
        ),
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  Widget getSocialBox(String icon, String label) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: () {
          signUpController.changeSource(label);
        },
        child: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: signUpController.source==label ? MyColors.colorLightPrimary : MyColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(//New
                blurRadius: 1.0,
              )
            ],
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Image.asset(
                  "assets/social/$icon",
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Text(
                  label,
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: MyColors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  getStep2() {
    return Form(
      key: signUpController.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Primary Skills', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GridView.custom(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  mainAxisExtent: standardValuesHeight
                // childAspectRatio: 3/4,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return getPSkillsDesign(signUpController.types[index]);
                },
                childCount: signUpController.types.length,
              ),
            ),
          ),
          if(signUpController.error_pri.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                signUpController.error_pri,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Secondary Skills', optional: '\t(Optional)', optionalFontSize: 11, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GridView.custom(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  mainAxisExtent: standardValuesHeight
                // childAspectRatio: 3/4,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return getSSkillsDesign(signUpController.types[index]);
                },
                childCount: signUpController.types.length,
              ),
            ),
          ),
          standardTFLabel(text: 'Specialisation', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GridView.custom(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  mainAxisExtent: standardValuesHeight
                // childAspectRatio: 3/4,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return getSpecsDesign(signUpController.specs[index]);
                },
                childCount: signUpController.specs.length,
              ),
            ),
          ),
          if(signUpController.error_spec.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                signUpController.error_spec,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Languages', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
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
                          color: MyColors.black,
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
                                color: MyColors.black,
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
                                color: MyColors.black,
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
                                color: MyColors.black,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
                ListView.separated(
                  itemCount: signUpController.langs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return getLangsDesign(signUpController.langs[index]);
                  },
                ),
              ],
            ),
          ),

          if(signUpController.error_lang.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                signUpController.error_lang,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Experience in years', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onChanged: (value) {
                signUpController.step2.currentState?.validate();
              },
              keyboardType: TextInputType.number,

              inputFormatters: [FilteringTextInputFormatter.deny(new RegExp('[\\-|\\ ]'))],
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.exp,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyColors.colorButton,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: "Enter your experience in years",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Image.asset(
                    "assets/sign_up/experience.png",
                    height: 10,
                    color: MyColors.colorButton,
                  ),
                ),
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }  else {
                  if('.'.allMatches(value??"").length<=1 && !(value??"").endsWith(".")) {
                    return null;
                  }
                  else {
                    return "* Invalid value";
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget getPSkillsDesign(TypeModel type) {
    return IgnorePointer(
      ignoring: signUpController.sec_types.contains(type),
      child: GestureDetector(
        onTap: () {
          signUpController.changePTypes(type);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: signUpController.sec_types.contains(type) ? MyColors.colorGrey.withOpacity(0.5) : signUpController.pri_types.contains(type) ? MyColors.colorLightPrimary : MyColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: signUpController.pri_types.contains(type) ? MyColors.colorButton : MyColors.borderColor()
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      type.type,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.black,
                        fontWeight: signUpController.pri_types.contains(type) ? FontWeight.w600 : null
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                signUpController.pri_types.contains(type) ? Icons.check : Icons.add,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSSkillsDesign(TypeModel type) {
    return IgnorePointer(
      ignoring: signUpController.pri_types.contains(type),
      child: GestureDetector(
        onTap: () {
          signUpController.changeSTypes(type);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: signUpController.pri_types.contains(type) ? MyColors.colorGrey.withOpacity(0.5) : signUpController.sec_types.contains(type) ? MyColors.colorLightPrimary : MyColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: signUpController.sec_types.contains(type) ? MyColors.colorButton : MyColors.borderColor()
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      type.type,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: GoogleFonts.manrope(
                        fontSize: 12.0,
                        color: MyColors.black,
                        fontWeight: signUpController.sec_types.contains(type) ? FontWeight.w600 : null
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                signUpController.sec_types.contains(type) ? Icons.check : Icons.add,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getSpecsDesign(SpecModel spec) {
    return GestureDetector(
      onTap: () {
        signUpController.changeSpecs(spec);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: signUpController.astro_specs.contains(spec) ? MyColors.colorLightPrimary : MyColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: signUpController.astro_specs.contains(spec) ? MyColors.colorButton : MyColors.borderColor()
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  spec.spec,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    color: MyColors.black,
                    fontWeight: signUpController.astro_specs.contains(spec) ? FontWeight.w600 : null
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              signUpController.astro_specs.contains(spec) ? Icons.check : Icons.add,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget getLangsDesign(LanguageModel lang) {
    return
      Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                lang.lang,
                style: GoogleFonts.manrope(
                  fontSize: 12.0,
                  color: MyColors.black,
                  fontWeight: FontWeight.w700
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
                    child: Checkbox(
                      value: signUpController.getValue(lang, "WRITE"),
                      // groupValue: signUpController.getGroupValue(lang),
                      onChanged: (value) {
                        print(value);
                        signUpController.changeLangs(lang, "WRITE", value??false);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Checkbox(
                      value: signUpController.getValue(lang, "SPEAK"),
                      // groupValue: signUpController.getGroupValue(lang),
                      onChanged: (value) {
                        print(value);
                        signUpController.changeLangs(lang, "SPEAK", value??false);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Checkbox(
                      value: signUpController.getValue(lang, "BOTH"),
                      // groupValue: signUpController.getGroupValue(lang),
                      onChanged: (value) {
                        print(value);
                        signUpController.changeLangs(lang, "BOTH", value??false);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              )
          )
        ],
      );
  }


  getStep3() {
    return Form(
      key: signUpController.step3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Mention you degree/diploma', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.degree,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter Degree/Diploma",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/sign_up/degree.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
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
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              signUpController.chooseSource("D");
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
              child: signUpController.degree_image!=null ?
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(signUpController.degree_image?.path ?? ""),
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
                    'Click to upload degree/diploma certificate',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(signUpController.error_d.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                signUpController.error_d,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Identity Proof', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<String>(
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search Proof Type",
                      ),
                    )
                ),
                itemAsString: (String proof) => proof,
                items: signUpController.proof_types,
                selectedItem: signUpController.identity,
                dropdownDecoratorProps:  DropDownDecoratorProps(
                    baseStyle: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                    dropdownSearchDecoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.colorButton,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Select Identity Proof",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Image.asset(
                            "assets/sign_up/identity.png",
                            height: 10,
                            color: MyColors.colorButton,
                          ),
                        )
                    )
                ),
                validator: (value) {
                  if (value==null) {
                    return "* Required";
                  }  else {
                    return null;
                  }
                },
                onChanged: (value) {
                  signUpController.changeIdentity(value);
                },
              )
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              signUpController.chooseSource("I");
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
              child: signUpController.identity_image!=null ?
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(signUpController.identity_image?.path ?? ""),
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
                    'Click to upload identity proof',
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if(signUpController.error_i.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                signUpController.error_i,
                style: GoogleFonts.manrope(
                    color: MyColors.colorError,
                    fontSize: 11
                ),
              ),
            ),
          standardTFLabel(text: 'Describe about yourself?', optional: '*', optionalExtra: '\t(Minimum of 150 characters)', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onChanged: (value){
                signUpController.update();
              },
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.about,
              maxLines: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Please let us know more about you",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              validator: (value) {
                if ((value??"").isEmpty) {
                  return "* Required";
                }
                else if (value!.length<150) {
                  return 'Please write atleast 150 characters of description';
                }
                else {
                  return null;
                }
              },
            ),
          ),
          if(signUpController.about.length<150)
            Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Minimum characters remaining ${signUpController.about.length}/150",
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

  getStep4() {
    return Form(
      key: signUpController.step4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'Call Rate (per minute)', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.call,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter rate in Rupees",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/common/rupee.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
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
          standardTFLabel(text: 'Chat Rate (per minute)', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.chat,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter rate in Rupees",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/common/rupee.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
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
          standardTFLabel(text: 'Minimum earning expectation from AstroGuide (per month)?', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.min,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter amount in Rupees",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/common/rupee.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
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
          standardTFLabel(text: 'Maximum earning expectation from AstroGuide (per month)?', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.black,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: signUpController.max,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.colorButton,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Enter amount in Rupees",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Image.asset(
                      "assets/common/rupee.png",
                      height: 10,
                      color: MyColors.colorButton,
                    ),
                  )
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
          standardTFLabel(text: 'Did anybody refer you to AstroGuide?', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                getReferBox(true, "Yes"),
                getReferBox(false, "No"),
              ],
            ),
          ),
          if(signUpController.refer==true)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                standardTFLabel(text: 'Who referred to you?', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16, ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    style: GoogleFonts.manrope(
                      fontSize: 16.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                    ),
                    controller: signUpController.reference,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyColors.colorButton,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: "Enter Reference",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Image.asset(
                            "assets/sign_up/profile.png",
                            height: 10,
                            color: MyColors.colorButton,
                          ),
                        )
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
          standardTFLabel(text: 'Where did you hear about AstroGuide?', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16,  left: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    getSocialBox("facebook2.png", "Facebook"),
                    SizedBox(
                      width: 10,
                    ),
                    getSocialBox("instagram.png", "Instagram")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    getSocialBox("youtube.png", "YouTube"),
                    SizedBox(
                      width: 10,
                    ),
                    getSocialBox("google.png", "Google Search")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    getSocialBox("snapchat.png", "Snapchat"),
                    SizedBox(
                      width: 10,
                    ),
                    getSocialBox("others.png", "Others")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  getState(int step) {
    if(step==signUpController.current) {
      return StepState.editing;
    }
    else if(step<signUpController.current) {
      return StepState.complete;
    }
    else {
      return StepState.disabled;
    }
  }

  getActive(int step) {
    if(step==signUpController.current) {
      return true;
    }
    else if(step<signUpController.current) {
      return true;
    }
    else {
      return false;
    }
  }

  getConnector(int step) {
    return step!=3 ? Text(
      "----------",
      style: TextStyle(
          color: getColor(step)
      ),
    ) : Container();
  }

  getColor(int step) {
    if(step<signUpController.current) {
      return MyColors.colorButton;
    }
    else {
      return MyColors.colorDivider;
      // return Colors.grey.shade400;
    }
  }

  getCustomStepper() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: standardVTBS),
      child: Column(
        children: [
          getSteps(),
          getStepDesign(signUpController.current),
          getStepButton(signUpController.current),
        ],
      ),
    );
  }

  getStepButton(int current) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(signUpController.current!=0)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: signUpController.onStepCancel,
                child: standardButton(
                  context: context,
                  backgroundColor: MyColors.white,
                  borderColor: MyColors.borderColor(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/controls/arrow_previous.png",
                        height: standardArrowH,
                        width: standardArrowW,
                        color: MyColors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: standardHTIS),
                        child: Text(
                          'Previous',
                          style: GoogleFonts.manrope(
                            fontSize: 16.0,
                            color: MyColors.black,
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
          if(signUpController.current!=0)
            SizedBox(
              width: standardHBBS,
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: signUpController.onStepContinue,
              child: standardButton(
                context: context,
                backgroundColor: signUpController.current==3
                ? signUpController.eval1==1 && signUpController.eval2==1 && signUpController.eval3==1
                  ? MyColors.colorButton
                  : MyColors.colorDivider
                : MyColors.colorButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        signUpController.current==3 ? 'Register' : 'Continue',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: signUpController.current==3
                              ? signUpController.eval1==1 && signUpController.eval2==1 && signUpController.eval3==1
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
                      color: signUpController.current==3
                        ? signUpController.eval1==1 && signUpController.eval2==1 && signUpController.eval3==1
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