import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/information/InformationController.dart';

class InformationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationController>(() => InformationController());

  }
}
