import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/otp/OTPController.dart';

class OTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
