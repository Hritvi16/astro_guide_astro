import 'package:astro_guide_astro/controllers/myBank/MyBankHistoryController.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get.dart';

class MyBankHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBankHistoryController>(() => MyBankHistoryController());

    Get.lazyPut<AstrologerRepository>(() => AstrologerRepository(Get.find()));
    Get.lazyPut<AstrologerProvider>(() => AstrologerProvider(Get.find()));
  }
}
