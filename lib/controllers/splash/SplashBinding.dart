// import 'package:astro_guide_astro/providers/UserProvider.dart';
// import 'package:astro_guide_astro/repositories/UserRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/splash/SplashController.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());

    // Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    // Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));
  }
}
