import 'package:astro_guide_astro/providers/SupportProvider.dart';
import 'package:astro_guide_astro/repositories/SupportRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/support/SupportChatController.dart';

class SupportChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportChatController>(() => SupportChatController());

    Get.lazyPut<SupportRepository>(() => SupportRepository(Get.find()));
    Get.lazyPut<SupportProvider>(() => SupportProvider(Get.find()));
  }
}
