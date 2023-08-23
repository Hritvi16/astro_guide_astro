import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/call/JoinScreenController.dart';

class JoinScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinScreenController>(() => JoinScreenController());
  }
}
