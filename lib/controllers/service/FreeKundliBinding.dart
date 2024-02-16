import 'package:astro_guide_astro/controllers/service/FreeKundliController.dart';
import 'package:astro_guide_astro/providers/HoroscopeProvider.dart';
import 'package:astro_guide_astro/repositories/HoroscopeRepository.dart';
import 'package:get/get.dart';

class FreeKundliBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreeKundliController>(() => FreeKundliController());

    Get.lazyPut<HoroscopeRepository>(() => HoroscopeRepository(Get.find()));
    Get.lazyPut<HoroscopeProvider>(() => HoroscopeProvider(Get.find()));
  }
}
