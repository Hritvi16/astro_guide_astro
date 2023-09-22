import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/UserProvider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserDetailController extends GetxController {
  UserDetailController();

  final storage = GetStorage();

  late UserProvider userProvider = Get.find();

  late UserModel user;

  late bool load;

  late int id;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    load = false;

    start();
  }

  start() {
    getUser();
  }


  Future<void> getUser() async {
    await userProvider.fetchByID(storage.read("access"), id.toString()).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        user = response.data!;
      }
      load = true;
      update();
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments, preventDuplicates: false)?.then((value) {
      print("objecttt");
      onInit();
    });
  }
}
