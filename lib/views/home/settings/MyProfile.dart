import 'dart:io';
import 'package:astro_guide_astro/constants/AstrologerConstants.dart';
import 'package:astro_guide_astro/constants/UserConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/state/StateModel.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/myProfile/MyProfileController.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class MyProfile extends StatelessWidget {
  MyProfile({ Key? key }) : super(key: key);

  final MyProfileController myProfileController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyProfileController>(
      builder: (controller) {
        return myProfileController.load ?
        Scaffold(
          // resizeToAvoidBottomInset: false,
          resizeToAvoidBottomInset: true,
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
                child: CustomAppBar("My Profile".tr),
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
          child: getStep(0, myProfileController.eval1),
        ),
        getConnector(0),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(1, myProfileController.eval2),
        ),
        getConnector(1),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: getStep(2, myProfileController.eval3),
        ),
      ],
    );
  }

  Widget getStep(int step, int eval) {
    return step==myProfileController.current ?
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



  getStepDesign(int step) {
    return Padding(
      padding: EdgeInsets.only(top: standardVTBS, left: 10, right: 10),
      child: step==0 ? getStep1() : step==1 ? getStep2() : getStep3(),
    );
  }

  getStep1() {
    return Form(
      key: myProfileController.step1,
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
                    radius: 70,
                    backgroundColor: MyColors.colorButton,
                    child: myProfileController.image==null ?
                    (myProfileController.astrologer.profile??"").isEmpty ?
                    CircleAvatar(
                      radius: 67,
                      child: Icon(
                        Icons.person,
                        color: MyColors.grey30,
                        size: 50,
                      ),
                      backgroundColor: MyColors.white,
                    ) :
                    CircleAvatar(
                        radius: 67,
                        backgroundImage: NetworkImage(ApiConstants.astrologerUrl+(myProfileController.astrologer.profile??""))
                    )  :
                    CircleAvatar(
                        radius: 67,
                        backgroundImage: FileImage(File(myProfileController.image?.path??""))
                    )
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      myProfileController.chooseSource();
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColors.colorButton
                      ),
                      child: Image.asset(
                        "assets/sign_up/camera.png",
                        color: MyColors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          standardTFLabel(text: 'Full Name', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              enabled: false,
              readOnly: true,
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: myProfileController.name,
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
          standardTFLabel(text: 'Mobile Number', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.number,
              enabled: false,
              readOnly: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: myProfileController.mobile,
              textInputAction: TextInputAction.next,
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
                  hintText: "Enter Mobile No.",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      myProfileController.changeCode();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 14),
                          child: myProfileController.country.imageFullUrl.startsWith("http") ?
                          Image.network(
                            myProfileController.country.imageFullUrl,
                            height: 24,
                            width: 33,
                          )
                              : Image.asset(
                            "assets/country/India.png",
                            height: 24,
                            width: 33,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            myProfileController.country.code,
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
          standardTFLabel(text: 'Email Address', optional: '\t(Optional)', optionalFontSize: 11),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.name,
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              textInputAction: TextInputAction.next,
              controller: myProfileController.email,
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
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }


  getStep2() {
    return Form(
      key: myProfileController.step2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          standardTFLabel(text: 'City', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DropdownSearch<CityModel>(
                enabled: false,
                popupProps:  const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Search City",
                      ),
                    )
                ),
                itemAsString: (CityModel city) => "${city.name}, ${city.state??""}, ${city.country??""}",
                items: myProfileController.cities,
                selectedItem: myProfileController.city,
                dropdownDecoratorProps:  DropDownDecoratorProps(
                    baseStyle: GoogleFonts.manrope(
                      fontSize: 16.0,
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
                  myProfileController.changeCity(value);
                },
              )
          ),
          standardTFLabel(text: 'Date of Birth', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              // onTap: () {
              //   BottomPicker.date(
              //     title:  "Set your Date of Birth",
              //     titleStyle: GoogleFonts.manrope(
              //       fontSize: 16.0,
              //       color: MyColors.colorButton,
              //       letterSpacing: 0,
              //       fontWeight: FontWeight.w600,
              //     ),
              //     onSubmit: (value) {
              //       myProfileController.setDOB(value);
              //     },
              //     backgroundColor: MyColors.backgroundColor(),
              //     closeIconColor: MyColors.iconColor(),
              //     bottomPickerTheme:  BottomPickerTheme.plumPlate,
              //     buttonText: "Done",
              //     buttonTextStyle: GoogleFonts.manrope(
              //       fontSize: 16.0,
              //       letterSpacing: 0,
              //       fontWeight: FontWeight.w600,
              //     ),
              //     pickerTextStyle: GoogleFonts.manrope(
              //       fontSize: 14.0,
              //     ),
              //     buttonSingleColor: Colors.transparent,
              //     displayButtonIcon: false,
              //   ).show(context);
              // },
              controller: myProfileController.dob,
              readOnly: true,
              enabled: false,
              keyboardType: TextInputType.datetime,
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
            child: IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  getGenderBox(UserConstants.M, "Male"),
                  getGenderBox(UserConstants.F, "Female"),
                  getGenderBox(UserConstants.O, "Other"),
                ],
              ),
            ),
          ),
          if(myProfileController.error_g.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                myProfileController.error_g,
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



  Widget getGenderBox(String value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: myProfileController.gender,
          activeColor: MyColors.colorButton,
          onChanged: (val) {
            myProfileController.changeGender(value);
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

  getStep3() {
    return Form(
      key: myProfileController.step3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          standardTFLabel(text: 'Describe about yourself?', optional: '*', optionalExtra: '\t(Minimum of 150 characters)', optionalColor: MyColors.red, optionalFontSize: 16, ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              onChanged: (value){
                myProfileController.update();
              },
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
              controller: myProfileController.about,
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
          if(myProfileController.about.length<150)
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "Minimum characters remaining ${myProfileController.about.length}/150",
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


  getState(int step) {
    if(step==myProfileController.current) {
      return StepState.editing;
    }
    else if(step<myProfileController.current) {
      return StepState.complete;
    }
    else {
      return StepState.disabled;
    }
  }

  getActive(int step) {
    if(step==myProfileController.current) {
      return true;
    }
    else if(step<myProfileController.current) {
      return true;
    }
    else {
      return false;
    }
  }

  getConnector(int step) {
    return step!=2 ? Text(
      "-------------",
      style: TextStyle(
          color: getColor(step)
      ),
    ) : Container();
  }

  getColor(int step) {
    if(step<myProfileController.current) {
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
          getStepDesign(myProfileController.current),
          SizedBox(
            height: 20,
          ),
          getStepButton(myProfileController.current),
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
          if(myProfileController.current!=0)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: GestureDetector(
                onTap: myProfileController.onStepCancel,
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
          if(myProfileController.current!=0)
            SizedBox(
              width: standardHBBS,
            ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: myProfileController.onStepContinue,
              child: standardButton(
                context: context,
                backgroundColor: myProfileController.current==2
                ? myProfileController.eval1==1 && myProfileController.eval2==1
                  ? myProfileController.city==null
                    ? MyColors.colorDivider
                    : MyColors.colorButton
                  : MyColors.colorDivider
                : MyColors.colorButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: standardHTIS),
                      child: Text(
                        myProfileController.current==2 ? 'Update' : 'Continue',
                        style: GoogleFonts.manrope(
                          fontSize: 16.0,
                          color: myProfileController.current==2
                            ? myProfileController.eval1==1 && myProfileController.eval2==1
                              ? myProfileController.city==null
                                ? MyColors.black
                              : MyColors.white
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
                      color: myProfileController.current==2
                        ? myProfileController.eval1==1 && myProfileController.eval2==1
                          ? myProfileController.city==null
                            ? MyColors.black
                          : MyColors.white
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