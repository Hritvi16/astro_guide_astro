import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:astro_guide_astro/providers/SpecProvider.dart';
import 'package:astro_guide_astro/repositories/UserRepository.dart';
import 'package:astro_guide_astro/repositories/SpecRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/wishlist/WishlistController.dart';

class WishlistBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());

    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
    Get.lazyPut<UserProvider>(() => UserProvider(Get.find()));
  }
}
