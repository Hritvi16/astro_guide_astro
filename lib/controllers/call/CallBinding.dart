import 'package:astro_guide_astro/controllers/call/CallController.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/repositories/MeetingRepository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallBinding implements Bindings {
  @override
  void dependencies() {
    clear();
    Get.lazyPut<CallController>(() => CallController());

    Get.lazyPut<MeetingRepository>(() => MeetingRepository(Get.find()));
    Get.lazyPut<MeetingProvider>(() => MeetingProvider(Get.find()));


  }

  Future<void> clear() async {

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print("ssweb: overrrrrr");
    // print(prefs.setString("calling_status", ""));
  }
}
