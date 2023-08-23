import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatListModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/providers/SpecProvider.dart';
import 'package:astro_guide_astro/repositories/ChatRepository.dart';
import 'package:astro_guide_astro/repositories/SpecRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ChatListController extends GetxController with GetSingleTickerProviderStateMixin {
  ChatListController();

  final storage = GetStorage();

  List<ChatHistoryModel> chats = [];

  late double amount;

  TextEditingController search = TextEditingController();
  late int current;
  late TabController tabController;
  PageController pageController = PageController(initialPage: 0);

  final ChatRepository chatRepository = Get.put(ChatRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late ChatProvider chatProvider;



  
  @override
  void onInit() {
    super.onInit();

    current = 0;
    amount = 0;
    tabController = TabController(length: 2, vsync: this);

    chatProvider = Get.put(ChatProvider(chatRepository));

    chats = [];

    start();
  }

  start() {
    getChats();
  }

  Future<void> getChats() async {
    print("helloooo");
    await chatProvider.fetch(storage.read("access"), ApiConstants.astrologerAPI+ApiConstants.all).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        chats = response.data??[];
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
    await getChats();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getChats();
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

  String getDisplayDateTime(String date) {
    DateTime today = DateTime.now();
    DateTime sent_at = DateTime.parse(date);
    print(sent_at);

    if(DateTime(today.year, today.month, today.day).compareTo(DateTime(sent_at.year, sent_at.month, sent_at.day))==0) {
      return DateFormat("hh:mm aa").format(sent_at);
    }
    else if(DateTime(today.year, today.month, today.day).difference(DateTime(sent_at.year, sent_at.month, sent_at.day)).inDays<7) {
      return DateFormat("EEEE").format(sent_at);
    }
    return DateFormat("dd/MM/yy").format(sent_at);;
  }

}
