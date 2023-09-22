import 'package:astro_guide_astro/controllers/theme/ThemesController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/languages/Languages.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/setting/SettingModel.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  SettingController();

  final storage = GetStorage();

  final ThemesController themesController = Get.find();

  final AstrologerRepository astrologerRepository = Get.put(AstrologerRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late AstrologerProvider astrologerProvider;
  late SettingModel setting;
  late AstrologerModel astrologer;
  late Map<String, String> languages;



  @override
  void onInit() {
    super.onInit();
    languages = Languages().languages;
    astrologerProvider = Get.put(AstrologerProvider(astrologerRepository));
    // astrologer = storage.read("astrologer");
    astrologer = AstrologerModel(id: -1, name: "", profile: "", mobile: '', email: '', experience: 0, about: '', gender: '', dob: '');
    start();
  }

  start() {
    getAstrologerDetails();
  }

  Future<void> getAstrologerDetails() async {
    await astrologerProvider.settings(storage.read("access"), ApiConstants.settings).then((response) async {
      print(response.toJson());

      if(response.code==1) {
        setting = response.data!;
        astrologer = response.astrologer!;
        update();
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> logout() async {
    Essential.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));

    await astrologerProvider.settings(storage.read("access"), ApiConstants.logout).then((response) async {
      print(response.toJson());
      Get.back();
      if(response.code==1) {
        storage.write("access", "essential");
        storage.write("refresh", "");
        storage.write("status", "logged out");
        Get.offAllNamed("/login");
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getAstrologerDetails();
    // await getSpecs();
  }

  void onLoading() async{
  }


  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> updateRate() async {
    await astrologerProvider.delete(storage.read("access"), ApiConstants.update+ApiConstants.rate).then((response) async {
      print(response.toJson());

      // if(response.code==1) {
      //   Essential.showSnackBar(response.message);
      // }
      // else if(response.code!=-1){
        Essential.showInfoDialog(response.message);
      // }
    });
  }


}
