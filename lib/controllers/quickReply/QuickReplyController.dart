import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class QuickReplyController extends GetxController {
  QuickReplyController();

  final storage = GetStorage();

  late List<QuickRepliesModel> replies;


  @override
  void onInit() {
    super.onInit();
    getMyQuickReplies();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> getMyQuickReplies() async {
    final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final ChatProvider chatProvider = Get.put(ChatProvider(chatRepository));

    print(storage.read("access"));
    chatProvider.fetchQuickReplies(storage.read("access"), ApiConstants.quickReplies+ApiConstants.active).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        replies = [];
        replies.addAll(response.data ?? []);
        update();
      }
    });
  }
  
  void sendQuickReply (QuickRepliesModel? value) {
    back(result: {"send" : true, "replies" : replies, "reply" : value?.reply});
  }
  
  void back({dynamic result}) {
    Get.back(result: result ?? {"replies" : replies,});
  }
}
