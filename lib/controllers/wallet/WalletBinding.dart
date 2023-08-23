import 'package:astro_guide_astro/providers/WalletProvider.dart';
import 'package:astro_guide_astro/repositories/WalletRepository.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/wallet/WalletController.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());

    Get.lazyPut<WalletRepository>(() => WalletRepository(Get.find()));
    Get.lazyPut<WalletProvider>(() => WalletProvider(Get.find()));
  }
}
