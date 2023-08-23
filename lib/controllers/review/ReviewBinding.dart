import 'package:astro_guide_astro/controllers/review/ReviewController.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:get/get.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));

    Get.lazyPut<ChatRepository>(() => ChatRepository(Get.find()));
    Get.lazyPut<ChatProvider>(() => ChatProvider(Get.find()));
  }
}
