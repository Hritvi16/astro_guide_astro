import 'package:astro_guide_astro/controllers/myGallery/MyGalleryController.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';


class MyGalleryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyGalleryController>(() => MyGalleryController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

  }
}
