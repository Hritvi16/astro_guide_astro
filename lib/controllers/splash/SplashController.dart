import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/notification_helper/NotificationHelper.dart';
// import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide_astro/cache_manager/CacheManager.dart';

class SplashController extends GetxController {
  SplashController();

  final storage = GetStorage();

  // late UserProvider userProvider = Get.find();

  @override
  void onInit() {
    taketo();
    super.onInit();
  }

  Future<void> taketo() async {

    if(!storage.hasData("fcm")) {
      // NotificationHelper.generateFcmToken(userProvider);
    }

    Future.delayed(Duration(seconds: 3), () async {
      CacheManager.deleteKeys();
      if (storage.read("status") == "logged in") {
        Get.offAllNamed('/home');
      }
      else {
        storage.write("access", CommonConstants.essential);
        storage.write("refresh", "");
        Get.offAllNamed('/login');
      }

      // storage.write("popbanner", 0);

    });

  }

  @override
  void dispose() {
    super.dispose();
  }
}
