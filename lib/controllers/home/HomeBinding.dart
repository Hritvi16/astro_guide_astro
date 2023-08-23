import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/home/HomeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
