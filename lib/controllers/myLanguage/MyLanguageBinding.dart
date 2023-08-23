import 'package:astro_guide_astro/controllers/myLanguage/MyLanguageController.dart';
import 'package:get/get.dart';


class MyLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLanguageController>(() => MyLanguageController());
  }
}
