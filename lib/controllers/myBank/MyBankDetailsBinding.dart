import 'package:astro_guide_astro/providers/CityProvider.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/CityRepository.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/myBank/MyBankDetailsController.dart';

class MyBankDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBankDetailsController>(() => MyBankDetailsController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
