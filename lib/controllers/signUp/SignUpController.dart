import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/UserConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/CityProvider.dart';
import 'package:astro_guide_astro/providers/CountryProvider.dart';
import 'package:astro_guide_astro/providers/StateProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/views/country/Country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../notification_helper/NotificationHelper.dart';

class SignUpController extends GetxController {
  SignUpController();

  final storage = GetStorage();
  late GlobalKey<FormState> step;
  late GlobalKey<FormState> step1;
  late GlobalKey<FormState> step2;
  late GlobalKey<FormState> step3;
  late GlobalKey<FormState> step4;

  late int eval1 = 0;
  late int eval2 = 0;
  late int eval3 = 0;
  late int eval4 = 0;

  late TextEditingController name = TextEditingController();
  late TextEditingController mobile = TextEditingController();
  late TextEditingController email = TextEditingController();

  late TextEditingController dob = TextEditingController();
  late TextEditingController exp = TextEditingController();

  late TextEditingController degree = TextEditingController();
  late TextEditingController reference = TextEditingController();
  late TextEditingController about = TextEditingController();
  late TextEditingController call = TextEditingController();
  late TextEditingController chat = TextEditingController();
  late TextEditingController min = TextEditingController();
  late TextEditingController max = TextEditingController();
  late DateTime date;
  late DateTime edate;
  late String gender;
  bool? refer;
  String? source;

  List<CountryModel> countries = [];
  late CountryModel country;
  // CountryModel? nationality;
  // List<StateModel> states = [];
  // StateModel? state;
  List<CityModel> cities = [];
  CityModel? city;

  List<String> proof_types = [];
  String? identity;

  List<TypeModel> types = [];
  List<TypeModel> pri_types = [];
  List<TypeModel> sec_types = [];

  List<LanguageModel> langs = [];
  List<Map<LanguageModel, String>> astro_langs = [];

  List<SpecModel> specs = [];
  List<SpecModel> astro_specs = [];


  XFile? image;
  XFile? degree_image;
  XFile? identity_image;

  late CountryProvider countryProvider = Get.find();
  late StateProvider stateProvider = Get.find();
  late CityProvider cityProvider = Get.find();
  late AstrologerProvider astrologerProvider = Get.find();

  late int current;

  // late bool verified;

  late String error_p, error_d, error_i, error_g, error_pri, error_spec, error_lang;
  late bool agree;

  @override
  void onInit() {
    agree = false;
    current = 0;
    // verified = false;
    step = GlobalKey<FormState>();
    step1 = GlobalKey<FormState>();
    step2 = GlobalKey<FormState>();
    step3 = GlobalKey<FormState>();
    step4 = GlobalKey<FormState>();

    name = TextEditingController();
    mobile = TextEditingController(text: Get.arguments['mobile']);
    email = TextEditingController();

    dob = TextEditingController();
    gender = "";

    reference = TextEditingController();

    proof_types = [
      "AADHAR CARD",
      "PAN CARD",
      "PASSPORT"
    ];

    countries = [
      CountryModel(id: -1, name: "India", nationality: "Indian", icon: "assets/country/India.png", code: "+91", imageFullUrl: "assets/country/India.png")
    ];
    country = countries.first;

    error_p = error_d = error_i = error_g = error_pri = error_spec = error_lang = "";

    date = DateTime.now();
    edate = DateTime(date.year, date.month, 01);

    agree = false;

    start();
    super.onInit();
  }

  start() {
    getValues();
  }

  void getValues() {
    astrologerProvider.fetchValues(storage.read("access"), ApiConstants.values).then((response) {
      print(response.toJson());
      if(response.code==1) {
        countries = response.countries??[];
        cities = response.cities??[];
        types = response.types??[];
        langs = response.languages??[];
        specs = response.specifications??[];

        for (var value in countries) {
          if(value.code.toUpperCase()==Get.arguments['code']) {
            country = value;
            break;
          }
        }
      }
      else {
        Future.delayed(Duration(seconds: 5), () {
        });
        getValues();
      }
      update();
    });
  }

  // void getStates(String id) {
  //   Map<String, dynamic> data = {
  //     StateConstant().co_id : id
  //   };
  //   stateProvider.fetchList(data, ApiConstants.country, storage.read("access")??CommonConstants.essential).then((response) {
  //     if(response.code==1) {
  //       states = response.data??[];
  //     }
  //     update();
  //   });
  // }

  // void getCities(String id) {
  //   Map<String, dynamic> data = {
  //     CityConstant().st_id : id
  //   };
  //   cityProvider.fetchList(data, ApiConstants.state, storage.read("access")??CommonConstants.essential).then((response) {
  //     if(response.code==1) {
  //       cities = response.data??[];
  //     }
  //     update();
  //   });
  // }

  void onStepCancel() {
    validateStep(current);
    current-=1;
    update();
    setCurrentEval(current);
  }

  void onStepContinue() {
    if(current==3) {
      validateStep(current);
    }
    else {
      if(validateStep(current)) {
        current += 1;
        update();
        setCurrentEval(current);
      }
    }
  }

  bool validateStep(int current) {
    print("validateeeeee");
    bool valid = false;
    if(current==0) {
      if(step1.currentState!.validate() && gender.isNotEmpty && image!=null) {
        eval1 = 1;
        error_p = "";
        error_g = "";
        return true;
      }
      else {
        eval1 = 2;
        error_p = "";
        error_g = "";

        if(image==null) {
          error_p = "* Please upload your profile image";
        }
        if(gender.isEmpty) {
          error_g = "* Please select a gender";
        }
        update();
        return false;
      }
    }
    else if(current==1) {
      if(step2.currentState!.validate() && pri_types.isNotEmpty && astro_specs.isNotEmpty && astro_langs.isNotEmpty) {
        eval2 = 1;
        error_pri = "";
        error_spec = "";
        error_lang = "";
        valid = true;
      }
      else {
        eval2 = 2;
        error_pri = "";
        error_spec = "";
        error_lang = "";

        if(pri_types.isEmpty) {
          error_pri = "* Please select atleast one primary skill";
        }
        if(astro_specs.isEmpty) {
          error_spec = "* Please select atleast one specialisation";
        }
        if(astro_langs.isEmpty) {
          error_lang = "* Please select atleast one language";
        }
        valid = false;
      }
    }
    else if(current==2) {
      // if(step3.currentState!.validate() && degree_image!=null && identity_image!=null) {
      if(step3.currentState!.validate() && identity_image!=null) {
        eval3 = 1;
        error_d = "";
        error_i = "";
        valid = true;
      }
      else {
        eval3 = 2;
        error_d = "";
        error_i = "";

        if(degree_image==null) {
          // error_d = "* Please upload your degree/diploma certificate";
        }
        if(identity_image==null) {
          error_i = "* Please upload your identity proof";
        }
        valid = false;
      }
    }
    else {
      if(step4.currentState!.validate()) {
        eval4 = 1;
        validate();
        valid = true;
      }
      else {
        eval4 = 2;
        valid = false;
      }
    }
    update();
    return valid;
  }

  void setCurrentEval(int current) {
    if(current==0) {
      eval1 = 0;
    }
    else if(current==1) {
      eval2 = 0;
    }
    else if(current==1) {
      eval3 = 0;
    }
    else {
      eval4 = 0;
    }
    update();
  }

  // void changeNationality(CountryModel? value) {
  //   nationality = value!;
  //   update();
  // }

  // void changeCountry(CountryModel? value) {
  //   country = value!;
  //   update();
  //   getStates(country!.id.toString());
  // }

  // void changeState(StateModel? value) {
  //   state = value!;
  //   update();
  //   getCities(state!.id.toString());
  // }

  void changeGender(String gender) {
    this.gender = gender;
    update();
  }

  void changeRefer(bool refer) {
    this.refer = refer;
    update();
  }

  void changeCity(CityModel? value) {
    city = value!;
    update();
  }

  void changeIdentity(String? value) {
    identity = value!;
    update();
  }

  void changeSource(String? value) {
    if(source==value) {
      source = "";
    }
    else {
      source = value;
    }
    update();
  }

  void setDOB(value) {
    date = value;
    dob.text = DateFormat("dd MMM, yyyy").format(date);
    update();
  }

  void setExperience(value) {
    edate = DateTime(value.year, value.month, 1);
    exp.text = DateFormat("MMM, yyyy").format(edate);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void validate() {
    if(eval1 == 1 && eval2 == 1 && eval3 ==1 && eval4 ==1) {
      // print("validated");
      register();
    }
  }

  void verify() {
    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+mobile.text,
    };

    astrologerProvider.login(data, CommonConstants.essential, ApiConstants.verify).then((response) {
      print(response.toJson());
      if(response.code==2) {
        goto("/otp", {"mobile" : mobile.text, "code" : country.code});
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> register() async {
    print(date.toString());

    Essential.showLoadingDialog();
    Map<String, List<String>> astro_types = getAstroTypes();
    Map<String, List<String>> langs = getAstroLangs();

    final FormData data = FormData({
      UserConstants.name : name.text,
      UserConstants.mobile : country.code+"-"+mobile.text,
      UserConstants.email : email.text,
      UserConstants.experience : DateFormat("yyyy-MM-dd").format(edate),
      UserConstants.about : about.text,
      UserConstants.gender : gender,
      UserConstants.dob : DateFormat("yyyy-MM-dd").format(date),
      UserConstants.ci_id : city!.id,
      UserConstants.identity : identity,
      UserConstants.profile : MultipartFile(File(image!.path), filename: image!.name),
      UserConstants.identity_image : MultipartFile(File(identity_image!.path), filename: identity_image!.name),

      UserConstants.reference : refer==true ? 1 : 0,
      UserConstants.reference_name : reference.text,
      UserConstants.source : source,
      UserConstants.min : min.text,
      UserConstants.max : max.text,

      UserConstants.call : call.text,
      UserConstants.chat : chat.text,

      UserConstants.degree : degree.text,
      if(degree_image!=null)
        UserConstants.degree_image : MultipartFile(File(degree_image!.path), filename: degree_image!.name),

      UserConstants.specification : getAstroSpecs(),

      UserConstants.type_id : astro_types['id'],
      UserConstants.types : astro_types['type'],

      // UserConstants.language : langs['id'],
      "language" : langs['id'],
      UserConstants.type : langs['type'],
      UserConstants.fcm : await NotificationHelper.generateFcmToken()
    });

    print(astro_types);
    print(astro_types['id']);

    print(langs);
    print(langs['id']);

    print(data.fields);
    print(data.files);

    astrologerProvider.add(CommonConstants.essential, ApiConstants.add, data).then((response) {
      print(response.toJson());
      Get.back();
      if(response.code==1) {
        Essential.showSnackBar("You have successfully signed up");
        storage.write("access", response.access_token);
        storage.write("refresh", response.refresh_token);
        storage.write("status", "logged in");
        Get.offAllNamed("/home");
        // Get.offAllNamed("/login");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void chooseSource(String type, BuildContext context) {
    Get.dialog(
      BasicDialog(
        text: "Choose one",
        btn1: "Camera",
        btn2: "Gallery",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Camera") {
        pickImage(type, ImageSource.camera, context);
      }
      else if (value == "Gallery") {
        pickImage(type, ImageSource.gallery, context);
        // openFiles();
      }
    });
  }

  Future<void> pickImage(String type, ImageSource imageSource, BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: imageSource, imageQuality: 40,);

    if (file != null) {
      if (type == "P") {
        image = file;
      }
      else if (type == "D") {
        degree_image = file;
      }
      else if (type == "I") {
        identity_image = file;
      }
      update();

      Uint8List? imageBytes;

      if (type == "P") {
        imageBytes = await image?.readAsBytes();
      }
      else if (type == "D") {
        imageBytes = await degree_image?.readAsBytes();
      }
      else if (type == "I") {
        {
          imageBytes = await identity_image?.readAsBytes();
        }

        if (imageBytes != null) {
          ImageCropping.cropImage(
              context: context,
              imageBytes: imageBytes!,
              onImageDoneListener: (data) async {
                imageBytes = data;

                final tempDir = await getTemporaryDirectory();
                final tempPath = path.join(tempDir.path, '${DateTime
                    .now()
                    .millisecondsSinceEpoch}.png');

                final file = File(tempPath);
                await file.writeAsBytes(imageBytes!);

                if (type == "P") {
                  image = XFile(file.path);
                }
                else if (type == "D") {
                  degree_image = XFile(file.path);
                }
                else if (type == "I") {
                  identity_image = XFile(file.path);
                }
                update();
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

  String getStepTitle(int step) {
    return step==0 ? "Personal Details" : step==1 ? "Skill Details" : step==2 ? "Other Details" : "Questionnaire";
  }

  goto(String path, dynamic data) {
    print(path);
    Get.toNamed(path, arguments: data)?.then((value) {
      // if(value=="verified") {
      //   verified = true;
      // }
      // else {
      //   verified = false;
      // }
      // update();
    });
  }

  void changePTypes(TypeModel type) {
    if(!pri_types.contains(type)) {
      pri_types.add(type);
    }
    else {
      pri_types.remove(type);
    }
    update();
  }

  void changeSTypes(TypeModel type) {
    if(!sec_types.contains(type)) {
      sec_types.add(type);
    }
    else {
      sec_types.remove(type);
    }
    update();
  }



  void changeSpecs(SpecModel spec) {
    if(!astro_specs.contains(spec)) {
      astro_specs.add(spec);
    }
    else {
      astro_specs.remove(spec);
    }
    update();
  }


  void changeLangs(LanguageModel lang, String type, bool value) {
    if(astro_langs.isNotEmpty) {
      int cnt = 0;
      print(astro_langs);
      for (var element in astro_langs) {
        print(element);
        if (element.containsKey(lang)) {
          cnt++;
          if(element[lang]==type) {
            if(value==false) {
              astro_langs.remove(element);
              break;
            }
          }
          else {
            if(value) {
              element[lang] = type;
            }
          }
        }
      }

      if(cnt==0) {
        if(value) {
          astro_langs.add({lang: type});
        }
      }
    }
    else {
      if(value) {
        astro_langs.add({lang: type});
      }
    }
    update();
  }

  getGroupValue(LanguageModel lang) {
    for (var element in astro_langs) {
      if(element.containsKey(lang)) {
        return element[lang];
      }
    }
    return "";
  }


  getValue(LanguageModel lang, String type) {
    for (var element in astro_langs) {
      if(element.containsKey(lang)) {
        return element[lang]==type;
      }
    }
    return false;
  }

  // void resetVerify() {
  //   verified = false;
  //   update();
  // }

  List<String> getAstroSpecs() {
    List<String> specs = [];
    for (var element in astro_specs) {
      specs.add(element.id.toString());
    }
    return specs;
  }

  Map<String, List<String>> getAstroTypes() {
    List<String> id = [];
    List<String> type = [];
    for (var element in pri_types) {
      id.add(element.id.toString());
      type.add("PRIMARY");
    }
    for (var element in sec_types) {
      id.add(element.id.toString());
      type.add("SECONDARY");
    }
    print(id);
    return {"id" : id, "type" : type};
  }

  Map<String, List<String>> getAstroLangs() {
    List<String> id = [];
    List<String> type = [];
    for (var element in astro_langs) {
      id.add(element.keys.first.id.toString());
      type.add(element[element.keys.first].toString());
    }
    return {"id" : id, "type" : type};
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

  Future<void> changeAgree(bool? value) async {
    if(value!=agree) {
      if(value==true) {
        if(await Essential.showBasicDialog(CommonConstants.tc, "Yes", "No").then((value) {
          if(value!="Yes") {
            return true;
          }
        })==true) {
          return;
        }
      }
      agree = value??false;
    }
    update();
  }

}
