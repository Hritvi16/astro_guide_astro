import 'dart:io';

import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/AstrologerConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/views/country/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
  List<CountryModel> countries = [];
  late CountryModel country;
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
    countries = [
      CountryModel(id: -1, name: "India", nationality: "Indian", icon: "assets/country/India.png", code: "+91", imageFullUrl: "assets/country/India.png")
    ];
    country = countries.first;
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
        countries = response.countries??[];
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
      // if(image!=null)
      //   ApiConstants.file : MultipartFile(File(image!.path), filename: image!.name),
      AstrologerConstants.name : name.text,
      AstrologerConstants.email : email.text,
      AstrologerConstants.dob : date.toString(),
      AstrologerConstants.about : about.text,
    });

    print(data);

    astrologerProvider.update(data, ApiConstants.myProfile+ApiConstants.update, storage.read("access")).then((response) {
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

  void updateProfile() {
    final FormData data = FormData({
      ApiConstants.file : MultipartFile(File(image!.path), filename: image!.name),
    });

    print(data);

    astrologerProvider.update(data,ApiConstants.profile, storage.read("access")).then((response) {
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


  void chooseSource(BuildContext context) {
    Get.dialog(
      const BasicDialog(
        text: "Choose one",
        btn1: "Camera",
        btn2: "Gallery",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Camera") {
        pickImage(ImageSource.camera, context);
      }
      else if (value == "Gallery") {
        pickImage(ImageSource.gallery, context);
        // openFiles();
      }
    });
  }


  Future<void> pickImage(ImageSource imageSource, BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: imageSource, imageQuality: 40,);

    if (file != null) {
      image = file;
      update();

      Uint8List? imageBytes = await image?.readAsBytes();

      if(imageBytes!=null) {
        ImageCropping.cropImage(
            context: context,
            imageBytes: imageBytes!,
            onImageDoneListener: (data) async {
              imageBytes = data;

              final tempDir = await getTemporaryDirectory();
              final tempPath = path.join(tempDir.path, '${DateTime.now().millisecondsSinceEpoch}.png');

              final file = File(tempPath);
              await file.writeAsBytes(imageBytes!);

              image = XFile(file.path);
              update();

              updateProfile();

            },
            customAspectRatios: [
              const CropAspectRatio(
                ratioX: 4,
                ratioY: 5,
              ),
            ],
            onImageStartLoading: showLoader,
            onImageEndLoading: hideLoader,
            visibleOtherAspectRatios: true,
            squareBorderWidth: 2,
            isConstrain: false,
            squareCircleColor: MyColors.red,
            defaultTextColor: MyColors.black,
            selectedTextColor: MyColors.orange,
            colorForWhiteSpace: MyColors.white,
            makeDarkerOutside: true,
            outputImageFormat: OutputImageFormat.jpg,
            encodingQuality: 10);
      }

      // updateProfile();
    }
  }
  void showLoader() {
    if (EasyLoading.isShow) {
      return;
    }
    EasyLoading.show(status: "Loading");
  }

  /// To hide loader
  void hideLoader() {
    EasyLoading.dismiss();
  }


  void setAstrologerData() {
    String mob = astrologer.mobile;
    String code = mob.substring(0, mob.indexOf("-"));
    name.text = astrologer.name;
    mobile.text = mob.substring(mob.indexOf("-")+1);
    email.text = astrologer.email;
    about.text = astrologer.about;
    gender = astrologer.gender;
    // pincode .text= astrologer.postal_code??"";
    if((astrologer.dob??"").isNotEmpty) {
      setDOB(DateTime.parse(astrologer.dob!));
    }
    for (var element in cities) {
      if(element.id==astrologer.ci_id) {
        city = element;
      }
    }
    for (var element in countries) {
      if(element.code==code) {
        country = element;
      }
    }
    load = true;
    update();
  }

  void changeCode() {
    Get.bottomSheet(
        isScrollControlled: true,
        Country(countries, country)
    ).then((value) {
      print(value);

      if(value!=null) {
        countries = value['countries'];
        country = value['country'];
        update();
      }
    });
  }
}
