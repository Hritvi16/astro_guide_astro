import 'package:astro_guide_astro/controllers/myQuickReplies/MyQuickRepliesController.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:get/get.dart';


class MyQuickRepliesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyQuickRepliesController>(() => MyQuickRepliesController());

    Get.lazyPut<ChatRepository>(() => ChatRepository(Get.find()));
    Get.lazyPut<ChatProvider>(() => ChatProvider(Get.find()));

  }
}
