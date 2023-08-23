
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyLanguageController extends GetxController {
  MyLanguageController();

  final storage = GetStorage();

  List<LanguageModel> langs = [];
  List<LanguageModel> astro_langs = [];

  late AstrologerProvider astrologerProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    start();
    super.onInit();
  }

  start() {
    getMyLanguage();
  }

  void getMyLanguage() {
    print(storage.read("access"));
    astrologerProvider.fetchLanguages(
        storage.read("access"), ApiConstants.languages).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        astro_langs.addAll(response.data ?? []);
        langs.addAll(response.languages ?? []);
      }
      load = true;
      update();
    });
  }


  void updateMyLanguage(int index, String type, String action, LanguageModel temp, int i) {
    final Map<String, dynamic> data = {
      CommonConstants.id : langs[index].id,
      "type" : type,
    };

    print(temp);

    langs[index] = langs[index].copyWith(load: false);
    update();

    astrologerProvider.updateStatus(storage.read("access"), ApiConstants.languages+action, data).then((response) {
      print(response.toJson());
      langs[index] = langs[index].copyWith(load: false);
      if (response.code == 1) {
        Essential.showSnackBar(response.message);
      }
      else {
        if(type==ApiConstants.delete) {
          astro_langs.add(temp);
        }
        else if(type==ApiConstants.add) {
          astro_langs.remove(temp);
        }
        else {
          astro_langs[i] = temp;
        }
        Essential.showSnackBar(response.message);
      }
      update();
    });
  }




  getValue(LanguageModel lang, String type) {
    for (var element in astro_langs) {
      if(element.id==lang.id) {
        return element.type==type;
      }
    }
    return false;
  }

  // void changeLangs(LanguageModel lang, String type, bool value) {
  //   if(astro_langs.isNotEmpty) {
  //     int cnt = 0;
  //     print(astro_langs);
  //     for (var element in astro_langs) {
  //       print(element);
  //       if(element.id==lang.id) {
  //         cnt++;
  //         if(element.type==type) {
  //           if(value==false) {
  //             astro_langs.remove(element);
  //             break;
  //           }
  //         }
  //         else {
  //           if(value) {
  //             element = element.copyWith(type: type);
  //           }
  //         }
  //       }
  //     }
  //
  //     if(cnt==0) {
  //       if(value) {
  //         astro_langs.add(lang.copyWith(type: type));
  //       }
  //     }
  //   }
  //   else {
  //     if(value) {
  //       astro_langs.add(lang.copyWith(type: type));
  //     }
  //   }
  //   update();
  // }

  Future<void> changeLangs(int index, LanguageModel lang, String type, bool value) async {
    langs[index] = langs[index].copyWith(load: true);
    update();
    print(lang);
    LanguageModel? temp;
    String action = "";
    int? ai;

    if(value) {
      if(astro_langs.isEmpty) {
        action = ApiConstants.add;
      }
      else {
        action = ApiConstants.add;


        for (int i=0; i<astro_langs.length; i++) {
          var element = astro_langs[i];
          if (element.id == lang.id) {
            action = ApiConstants.update;
            ai = i;
            temp = element;
            astro_langs[i] = element.copyWith(type: type);
            break;
          }
        }
      }

      if(action==ApiConstants.add) {
        temp = lang.copyWith(type: type);
        astro_langs.add(temp);
        update();
      }
      else {
        update();
      }
    }
    else {
      for (var element in astro_langs) {
        if (element.id == lang.id) {
          temp = element;
          break;
        }
      }

      if(temp!=null) {
        astro_langs.remove(temp);
        action = ApiConstants.delete;
        update();
      }
    }

    if(temp!=null) {
      await Future.delayed(Duration(seconds: 1), () {
        updateMyLanguage(index, type, action, temp!, ai??-1);
      });
    }
  }

}