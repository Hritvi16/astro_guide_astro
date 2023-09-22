import 'package:astro_guide_astro/controllers/userDetail/UserDetailController.dart';
import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:astro_guide_astro/repositories/UserRepository.dart';
import 'package:get/get.dart';

class UserDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDetailController>(() => UserDetailController());

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));
  }
}
