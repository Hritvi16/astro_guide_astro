import 'package:astro_guide_astro/notifier/GlobalNotifier.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:astro_guide_astro/services/networking/BaseProvider.dart';
import 'package:astro_guide_astro/shared/middleware/InternetMiddleware.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BaseProvider(), permanent: true);
    Get.put(ApiService(Get.find()), permanent: true);
    Get.put(InternetMiddleware());
    Get.put<GlobalNotifier>(GlobalNotifier());
  }
}
