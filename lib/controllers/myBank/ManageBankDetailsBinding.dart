import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/myBank/ManageBankDetailsController.dart';

class ManageBankDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageBankDetailsController>(() => ManageBankDetailsController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
