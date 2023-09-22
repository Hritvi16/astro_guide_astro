import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/wallet/WalletHistoryModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/providers/HistoryProvider.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/repositories/HistoryRepository.dart';
import 'package:astro_guide_astro/repositories/MeetingRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryController extends GetxController with GetTickerProviderStateMixin {
  HistoryController();

  final storage = GetStorage();

  List<WalletHistoryModel> wallet = [];
  List<WalletHistoryModel> payment = [];
  List<SessionHistoryModel> call = [];
  List<SessionHistoryModel> chat = [];

  late double amount;

  TextEditingController search = TextEditingController();
  late int current;
  late TabController tabController;
  PageController pageController = PageController(initialPage: 0);

  final HistoryRepository historyRepository = Get.put(HistoryRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late HistoryProvider historyProvider;

  final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late ChatProvider chatProvider;

  final MeetingRepository meetingRepository = Get.put(MeetingRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late MeetingProvider meetingProvider;


  @override
  void onInit() {
    super.onInit();
    current = 0;
    amount = 0;
    tabController = TabController(length: 2, vsync: this);

    historyProvider = Get.put(HistoryProvider(historyRepository));
    chatProvider = Get.put(ChatProvider(chatRepository));
    meetingProvider = Get.put(MeetingProvider(meetingRepository));

    start();
  }

  start() {
    getHistory();
  }

  Future<void> getHistory() async {
    print("helloooo");
    await historyProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.astrologer).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        amount = response.amount??0;
        wallet = response.wallet??[];
        payment = response.payment??[];
        call = response.call??[];
        chat = response.chat??[];
        update();
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void logout() {
    storage.write("access", "essential");
    storage.write("refresh", "");
    storage.write("status", "logged out");
    Get.offAllNamed("/login");
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getHistory();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments)?.then((value) {
      // getHistory();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTab(int index) {
    tabController.index = index;
    update();
  }

  void changeMainTab(int index) {
    current = index;
    update();
  }



  Future<void> reconnect(int index) async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : chat[index].id,
    };

    print(data);

    await chatProvider.reconnect(storage.read("access"), ApiConstants.reconnect, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/chat", arguments: {"wallet" : response.wallet, "user" : response.user, "ch_id" : response.ch_id, "type" : "RECONNECT", "action" : "RECONNECTING"});
      }
      else if (response.code==0) {
        List<SessionHistoryModel> temp = List.from(chat);
        temp[index] = response.data!;
        chat = temp;
        Essential.showInfoDialog(response.message, btn: "OK");
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> recall(int index) async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : call[index].id,
    };

    print(data);

    await meetingProvider.reconnect(storage.read("access"), ApiConstants.reconnect, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/call", arguments: {"wallet" : response.wallet, "user" : response.user, "ch_id" : response.ch_id, "type" : "RECONNECT", "action" : "RECONNECTING", "meetingID" : response.data?.meeting_id, "session_history" : response.data});
      }
      else if (response.code==0) {
        List<SessionHistoryModel> temp = List.from(call);
        temp[index] = response.data!;
        call = temp;
        Essential.showInfoDialog(response.message, btn: "OK");
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }

}
