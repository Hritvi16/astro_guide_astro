import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MySpecController extends GetxController {
  MySpecController();

  final storage = GetStorage();

  List<SpecModel> specs = [];
  List<SpecModel> astro_specs = [];

  late AstrologerProvider astrologerProvider = Get.find();

  late bool load;

  @override
  void onInit() {
    load = false;
    start();
    super.onInit();
  }

  start() {
    getMySpec();
  }

  void getMySpec() {
    print(storage.read("access"));
    astrologerProvider.fetchSpecs(storage.read("access"), ApiConstants.specs).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        astro_specs.addAll(response.data ?? []);
        specs.addAll(response.specs ?? []);
      }
      load = true;
      update();
    });
  }


  void updateMySpec(int index, String action, SpecModel temp, int i) {
    final Map<String, dynamic> data = {
      CommonConstants.id : specs[index].id,
    };

    print(temp);

    specs[index] = specs[index].copyWith(load: false);
    update();

    astrologerProvider.updateStatus(storage.read("access"), ApiConstants.specAPI+action, data).then((response) {
      print(response.toJson());
      specs[index] = specs[index].copyWith(load: false);
      if (response.code == 1) {
        Essential.showSnackBar(response.message);
      }
      else {
        if(action==ApiConstants.delete) {
          astro_specs.add(temp);
        }
        else if(action==ApiConstants.add) {
          astro_specs.remove(temp);
        }
        else {
          astro_specs[i] = temp;
        }
        Essential.showSnackBar(response.message);
      }
      update();
    });
  }




  getValue(SpecModel spec) {
    for (var element in astro_specs) {
      if(element.id==spec.id) {
        return true;
      }
    }
    return false;
  }

  Future<void> changeSpecs(int index, SpecModel spec, bool value) async {
    specs[index] = specs[index].copyWith(load: true);
    update();
    print(spec);
    SpecModel? temp;
    String action = "";
    int? ai;

    if(value) {
      action = ApiConstants.add;

      temp = spec;
      astro_specs.add(temp);
      update();
    }
    else {
      for (var element in astro_specs) {
        if (element.id == spec.id) {
          temp = element;
          break;
        }
      }

      if(temp!=null) {
        astro_specs.remove(temp);
        action = ApiConstants.delete;
        update();
      }
    }

    if(temp!=null) {
      await Future.delayed(Duration(seconds: 1), () {
        updateMySpec(index, action, temp!, ai??-1);
      });
    }
  }

}