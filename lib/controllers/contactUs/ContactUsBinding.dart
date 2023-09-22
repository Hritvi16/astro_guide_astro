import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/contactUs/ContactUsController.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(() => ContactUsController());

  }
}
