import 'package:astro_guide_astro/providers/TypeProvider.dart';
import 'package:astro_guide_astro/repositories/TypeRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/support/SupportController.dart';

class SupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(() => SupportController());
  }
}
