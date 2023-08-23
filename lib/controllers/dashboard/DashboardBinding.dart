import 'package:get/get.dart';
import 'package:astro_guide_astro/controllers/dashboard/DashboardController.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
