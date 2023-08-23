import 'dart:io';
import 'package:astro_guide_astro/constants/BankConstants.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/bank/BankModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ManageBankDetailsController extends GetxController {
  ManageBankDetailsController();

  final storage = GetStorage();
  late GlobalKey<FormState> step1;
  late GlobalKey<FormState> step2;

  late int eval1 = 0;
  late int eval2 = 0;

  late TextEditingController bank_name;
  late TextEditingController branch;
  late TextEditingController holder_name;
  late TextEditingController about;
  late TextEditingController account_no;
  late TextEditingController ifsc;


  late BankModel bank;

  XFile? cheque;

  late AstrologerProvider astrologerProvider = Get.find();

  late int current;
  late bool load;
  late String action;
  late String error_c;

  @override
  void onInit() {
    current = 0;
    step1 = GlobalKey<FormState>();
    step2 = GlobalKey<FormState>();

    bank_name = TextEditingController();
    branch = TextEditingController();
    holder_name = TextEditingController();
    account_no = TextEditingController();
    ifsc = TextEditingController();

    error_c = "";

    load = false;
    if(Get.arguments!=null) {
      bank = Get.arguments;
      action = ApiConstants.update;
      setBankData();
    }
    else {
      action = ApiConstants.add;
      load = true;
    }
    super.onInit();
  }

  void onStepCancel() {
    validateStep(current, true);
    current-=1;
    update();
    setCurrentEval(current);
  }

  void onStepContinue() {
    if(current==1) {
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
      if(step1.currentState!.validate()) {
        eval1 = 1;
      }
      else {
        eval1 = 2;
      }
    }
    else {
      if(step2.currentState!.validate() && (cheque!=null || (action==ApiConstants.update && bank.cheque.isNotEmpty))) {
        eval2 = 1;
        error_c = "";
        if(cheque==null && ((action==ApiConstants.update && bank.cheque.isEmpty) || action==ApiConstants.add)) {
          error_c = "* Please upload cheque image";
        }
        else {
          validate();
        }
      }
      else {
        eval2 = 2;
        error_c = "";
        print(cheque==null);
        print(action);
        if(cheque==null && ((action==ApiConstants.update && bank.cheque.isNotEmpty) || action==ApiConstants.add)) {
          error_c = "* Please upload cheque image";
        }
      }
    }
    update();
  }

  void setCurrentEval(int current) {
    if(current==0) {
      eval1 = 0;
    }
    else {
      eval2 = 0;
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validate() {
    if(eval1 == 1 && eval2 == 1) {
      manageBankDetails();
    }
  }

  void manageBankDetails() {
    final FormData data = FormData({
      if(cheque!=null)
        BankConstants.cheque : MultipartFile(File(cheque!.path), filename: cheque!.name, ),
      BankConstants.bank_name : bank_name.text,
      BankConstants.branch : branch.text,
      BankConstants.holder_name : holder_name.text,
      BankConstants.account_no : account_no.text,
      BankConstants.ifsc : ifsc.text,
      if(action==ApiConstants.update)
        CommonConstants.id : bank.id
    });

    print(data.files);
    print(data.fields);

    astrologerProvider.add(ApiConstants.bankAPI+action, storage.read("access"), data).then((response) {
      print(response.toJson());
      if(response.code==1) {
        Get.back();
        Essential.showSnackBar(response.message);

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
      cheque = file;
      update();
    }
  }

  Future<void> openFiles() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFileList = await picker.pickImage(
      imageQuality: 40, source: ImageSource.gallery,
    );

    if (pickedFileList!=null) {
      cheque = pickedFileList;
      update();
    }
  }

  void setBankData() {
    bank_name.text = bank.bank_name;
    branch.text = bank.branch;
    holder_name.text = bank.holder_name;
    ifsc.text = bank.ifsc;
    account_no.text = bank.account_no;
    load = true;
    update();
  }

}
