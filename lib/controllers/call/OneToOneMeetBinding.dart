import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/call/OneToOneMeetController.dart';

class OneToOneMeetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneToOneMeetController>(() => OneToOneMeetController());
  }
}
