import 'package:astro_guide_astro/controllers/mySpec/MySpecController.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';


class MySpecBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySpecController>(() => MySpecController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

  }
}
