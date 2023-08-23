import 'package:astro_guide_astro/providers/CountryProvider.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/CountryRepository.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/login/LoginController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());

    Get.lazyPut<CountryRepository>(() => CountryRepository(Get.find()));
    Get.lazyPut<CountryProvider>(() => CountryProvider(Get.find()));

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

  }
}
