import 'package:astro_guide_astro/providers/CityProvider.dart';
import 'package:astro_guide_astro/providers/CountryProvider.dart';
import 'package:astro_guide_astro/providers/StateProvider.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/CityRepository.dart';
import 'package:astro_guide_astro/repositories/CountryRepository.dart';
import 'package:astro_guide_astro/repositories/StateRepository.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/signUp/SignUpController.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

    Get.lazyPut<CountryRepository>(() => CountryRepository(Get.find()));
    Get.lazyPut<CountryProvider>(() => CountryProvider(Get.find()));

    Get.lazyPut<StateRepository>(() => StateRepository(Get.find()));
    Get.lazyPut<StateProvider>(() => StateProvider(Get.find()));

    Get.lazyPut<CityRepository>(() => CityRepository(Get.find()));
    Get.lazyPut<CityProvider>(() => CityProvider(Get.find()));
  }
}
