import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/history/HistoryController.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());


  }
}
