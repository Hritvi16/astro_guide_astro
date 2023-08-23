import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MySkillController extends GetxController {
  MySkillController();

  final storage = GetStorage();

  List<TypeModel> types = [];
  List<TypeModel> astro_types = [];

  late AstrologerProvider astrologerProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    start();
    super.onInit();
  }

  start() {
    getMySkill();
  }

  void getMySkill() {
    print(storage.read("access"));
    astrologerProvider.fetchTypes(storage.read("access"), ApiConstants.typeAPI).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        astro_types.addAll(response.data ?? []);
        types.addAll(response.types ?? []);
      }
      load = true;
      update();
    });
  }


  void updateMySkill(int index, String type, String action, TypeModel temp, int i) {
    final Map<String, dynamic> data = {
      CommonConstants.id : types[index].id,
      "type" : type,
    };

    print(temp);

    types[index] = types[index].copyWith(load: false);
    update();

    astrologerProvider.updateStatus(storage.read("access"), ApiConstants.typeAPI+action, data).then((response) {
      print(response.toJson());
      types[index] = types[index].copyWith(load: false);
      if (response.code == 1) {
        Essential.showSnackBar(response.message);
      }
      else {
        if(type==ApiConstants.delete) {
          astro_types.add(temp);
        }
        else if(type==ApiConstants.add) {
          astro_types.remove(temp);
        }
        else {
          astro_types[i] = temp;
        }
        Essential.showSnackBar(response.message);
      }
      update();
    });
  }


  getValue(TypeModel type, String t_type) {
    for (var element in astro_types) {
      if(element.id==type.id) {
        return element.t_type==t_type;
      }
    }
    return false;
  }

  bool validate() {
    int cnt = 0;
    for (var element in astro_types) {
      if(element.t_type=="PRIMARY") {
        if(cnt>0) {
          return true;
        }
        cnt++;
      }
    }
    return false;
  }

  Future<void> changeTypes(int index, TypeModel type, String t_type, bool value) async {
    types[index] = types[index].copyWith(load: true);
    update();
    print(type);
    TypeModel? temp;
    String action = "";
    int? ai;

    if(value) {
      if(astro_types.isEmpty) {
        action = ApiConstants.add;
      }
      else {
        action = ApiConstants.add;


        for (int i=0; i<astro_types.length; i++) {
          var element = astro_types[i];
          if (element.id == type.id) {
            action = ApiConstants.update;
            ai = i;
            temp = element;
            astro_types[i] = element.copyWith(t_type: t_type);
            break;
          }
        }
      }

      if(action==ApiConstants.add) {
        temp = type.copyWith(t_type: t_type);
        astro_types.add(temp);
        update();
      }
      else {
        update();
      }
    }
    else {
      for (var element in astro_types) {
        if (element.id == type.id) {
          temp = element;
          break;
        }
      }

      if(temp!=null) {
        astro_types.remove(temp);
        action = ApiConstants.delete;
        update();
      }
    }

    if(temp!=null) {
      await Future.delayed(Duration(seconds: 1), () {
        updateMySkill(index, t_type, action, temp!, ai ?? -1);
      });
    }
  }

}