import 'dart:io';

import 'package:astro_guide_astro/constants/CityConstants.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/StateConstants.dart';
import 'package:astro_guide_astro/constants/AstrologerConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/state/StateModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/providers/CityProvider.dart';
import 'package:astro_guide_astro/providers/CountryProvider.dart';
import 'package:astro_guide_astro/providers/StateProvider.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MyProfileController extends GetxController {
  MyProfileController();

  final storage = GetStorage();
  late GlobalKey<FormState> step1;
  late GlobalKey<FormState> step2;
  late GlobalKey<FormState> step3;

  late int eval1 = 0;
  late int eval2 = 0;
  late int eval3 = 0;

  late TextEditingController name = TextEditingController();
  late TextEditingController mobile = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController about = TextEditingController();

  late TextEditingController dob = TextEditingController();
  late DateTime date;
  late String gender;

  late AstrologerModel astrologer;
  List<CityModel> cities = [];
  CityModel? city;
  late TextEditingController pincode = TextEditingController();

  XFile? image;

  late AstrologerProvider astrologerProvider = Get.find();

  late int current;
  late bool load;
  late String error_g;

  @override
  void onInit() {
    current = 0;
    step1 = GlobalKey<FormState>();
    step2 = GlobalKey<FormState>();
    step3 = GlobalKey<FormState>();

    name = TextEditingController();
    mobile = TextEditingController();
    email = TextEditingController();

    dob = TextEditingController();
    gender = 'FEMALE';

    pincode = TextEditingController();


    load = false;
    error_g = "";
    start();
    super.onInit();
  }

  start() {
    getMyProfile();
  }

  void getMyProfile() {
    print(storage.read("access"));
    astrologerProvider.fetchSingle(storage.read("access"), ApiConstants.myProfile).then((response) {
      print(response.toJson());
      if(response.code==1) {
        astrologer = response.data!;
        cities = response.cities??[];
        update();
        setAstrologerData();
      }
    });
  }

  void onStepCancel() {
    validateStep(current, true);
    current-=1;
    update();
    setCurrentEval(current);
  }

  void onStepContinue() {
    if(current==2) {
      validateStep(current, false);
    }
    else {
      validateStep(current, false);
      current+=1;
      update();
      setCurrentEval(current);
    }
  }

  void validateStep(int current, bool back) {
    if(current==0) {
      print(step1.currentState!.validate());
      if(step1.currentState!.validate() && (image!=null || (astrologer.profile??"").isNotEmpty)) {
        eval1 = 1;
      }
      else {
        eval1 = 2;
      }
    }
    else if(current==1) {
      if(step2.currentState!.validate() && gender.isNotEmpty) {
        eval2 = 1;
        error_g = "";
        if(gender.isEmpty) {
          error_g = "* Please select a gender";
        }
      }
      else {
        eval2 = 2;
        error_g = "";
      }
    }
    else {
      if(step3.currentState!.validate()) {
        eval3 = 1;
        if(!back) {
          validate();
        }
      }
      else {
        eval3 = 2;
      }
    }
    update();
  }

  void setCurrentEval(int current) {
    if(current==0) {
      eval1 = 0;
    }
    else if(current==1) {
      eval2 = 0;
    }
    else {
      eval3 = 0;
    }
    update();
  }

  void changeGender(String gender) {
    this.gender = gender;
    update();
  }

  void changeCity(CityModel? value) {
    city = value!;
    update();
  }

  void setDOB(value) {
    date = value;
    dob.text = DateFormat("dd MMM, yyyy").format(date);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validate() {
    if(eval1 == 1 && eval2 == 1 && eval3 ==1) {
      updateMyProfile();
    }
  }

  void updateMyProfile() {

    final FormData data = FormData({
      if(image!=null)
        ApiConstants.file : MultipartFile(File(image!.path), filename: image!.name),
      AstrologerConstants.name : name.text,
      AstrologerConstants.email : email.text,
      AstrologerConstants.dob : date.toString(),
      AstrologerConstants.about : about.text,
    });

    print(data);

    astrologerProvider.update(data, storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        Essential.showSnackBar(response.message);
        load = false;
        update();
        getMyProfile();
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void chooseSource() {
    Get.dialog(
      BasicDialog(
        text: "Choose one",
        btn1: "Camera",
        btn2: "Gallery",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Camera") {
        openCamera();
      }
      else if (value == "Gallery") {
        openFiles();
      }
    });
  }


  Future<void> openCamera() async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: ImageSource.camera, imageQuality: 40,);

    if (file != null) {
      image = file;
      update();
    }
  }

  Future<void> openFiles() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFileList = await picker.pickImage(
      imageQuality: 40, source: ImageSource.gallery,
    );

    if (pickedFileList!=null) {
      image = pickedFileList;
      update();
    }
  }

  void setAstrologerData() {
    name.text = astrologer.name;
    mobile.text = astrologer.mobile;
    email.text = astrologer.email??"";
    about.text = astrologer.about??"";
    gender = astrologer.gender??"";
    // pincode .text= astrologer.postal_code??"";
    if((astrologer.dob??"").isNotEmpty) {
      setDOB(DateTime.parse(astrologer.dob!));
    }
    for (var element in cities) {
      if(element.id==astrologer.ci_id) {
        city = element;
      }
    }
    load = true;
    update();
  }

}
