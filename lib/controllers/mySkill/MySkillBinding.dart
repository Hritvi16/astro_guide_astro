import 'package:astro_guide_astro/controllers/mySkill/MySkillController.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';


class MySkillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySkillController>(() => MySkillController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

  }
}
