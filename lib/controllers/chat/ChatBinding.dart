import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/chat/ChatController.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());

    Get.lazyPut<ChatRepository>(() => ChatRepository(Get.find()));
    Get.lazyPut<ChatProvider>(() => ChatProvider(Get.find()));
  }
}
