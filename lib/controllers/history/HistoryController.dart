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
  GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();


  List<WalletHistoryModel> wallet = [];
  List<WalletHistoryModel> payment = [];
  List<SessionHistoryModel> call = [];
  List<SessionHistoryModel> chat = [];

  List<SessionHistoryModel> fcall = [];
  List<SessionHistoryModel> fchat = [];

  List<WalletHistoryModel> swallet = [];
  List<WalletHistoryModel> spayment = [];
  List<SessionHistoryModel> scall = [];
  List<SessionHistoryModel> schat = [];

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

  late int selected;
  late bool load;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    current = 0;
    amount = 0;
    tabController = TabController(length: 2, vsync: this);

    historyProvider = Get.put(HistoryProvider(historyRepository));
    chatProvider = Get.put(ChatProvider(chatRepository));
    meetingProvider = Get.put(MeetingProvider(meetingRepository));

    selected = 0;
    load = false;
    scrollController = ScrollController();
    start();
  }

  start() {
    getHistory();
  }

  Future<void> getHistory() async {
    print("helloooo");
    await historyProvider.fetch(storage.read("access")??CommonConstants.essential, ApiConstants.astrologer).then((response) async {
      print("response.toJson() historyyy");
      print(response.toJson());
      if(response.code==1) {
        amount = response.amount??0;
        wallet = response.wallet??[];
        payment = response.payment??[];
        call = response.call??[];
        chat = response.chat??[];
        fcall = [];
        fchat = [];

        swallet = [];
        spayment = [];
        scall = [];
        schat = [];
        update();

        if(current==0) {
          if(tabController.index==0) {
            getSWallet(0);
          }
          else {
            getSPayment(0);
          }
        }
        else if(current==1) {
          getSCall(0);
        }
        else if(current==2) {
          getSChat(0);
        }
      }
      else {
        Essential.showSnackBar(response.message);
      }

      load = true;
      update();
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
      getHistory();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  void changeTab(int index) {
    print(index);
    print(tabController.index);
    if(tabController.previousIndex!=index) {
      if (index == 0) {
        getSWallet(0);
      }
      else {
        getSPayment(0);
      }
    }
  }

  void changeMainTab(int index) {
    if(current!=index) {
      current = index;
      selected = 0;
      scrollController.jumpTo(0);
      update();

      if (index == 0) {
        if (tabController.index == 0) {
          getSWallet(0);
        }
        else {
          getSPayment(0);
        }
      }
      else if (index == 1) {
        getSCall(0);
      }
      else if (index == 2) {
        getSChat(0);
      }
    }
  }



  Future<void> reconnect(int index) async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : schat[index].id,
    };

    print(data);

    await chatProvider.reconnect(storage.read("access"), ApiConstants.reconnect, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/chat", arguments: {"wallet" : response.wallet, "user" : response.user, "ch_id" : response.ch_id, "type" : "RECONNECT", "action" : "RECONNECTING"});
      }
      else if (response.code==0) {
        Essential.showInfoDialog(response.message, btn: "OK");
        List<SessionHistoryModel> temp = List.from(chat);
        int ind = temp.indexWhere((element) => element.id==schat[index].id);
        temp[ind] = response.data!;
        chat = temp;

        temp = List.from(schat);
        temp[index] = response.data!;
        schat = temp;
        Essential.showInfoDialog(response.message, btn: "OK");
        update();
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> recall(int index) async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : scall[index].id,
    };

    print(data);

    await meetingProvider.reconnect(storage.read("access"), ApiConstants.reconnect, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        goto("/call", arguments: {"wallet" : response.wallet, "user" : response.user, "ch_id" : response.ch_id, "type" : "RECONNECT", "action" : "RECONNECTING", "meetingID" : response.data?.meeting_id, "session_history" : response.data});
      }
      else if (response.code==0) {
        List<SessionHistoryModel> temp = List.from(call);
        int ind = temp.indexWhere((element) => element.id==scall[index].id);
        temp[ind] = response.data!;
        call = temp;

        temp = List.from(scall);
        temp[index] = response.data!;
        scall = temp;
        Essential.showInfoDialog(response.message, btn: "OK");
        update();
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }

  void getSWallet(int i) {
    print("wallet.length");
    print(wallet.length);
    print(i);
    if(i==0) {
      swallet = [];
    }
    if(swallet.length!=wallet.length) {
      swallet.addAll(wallet.sublist(i, wallet.length <= (i + 30) ? wallet.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getSPayment(int i) {
    print("payment.length");
    print(payment.length);
    print(i);
    if(i==0) {
      spayment = [];
      update();
    }
    if(spayment.length!=payment.length) {
      spayment.addAll(payment.sublist(i, payment.length <= (i + 30) ? payment.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getSCall(int i) {
    if(i==0) {
      scall = [];
      fcall = selected==0 ? call : call.where((element) {
        if(element.status==CommonConstants.session_status[selected]) {
          return true;
        }
        return false;
      }).toList();
      update();
    }
    print(fcall);
    if(fcall.isNotEmpty && scall.length!=fcall.length) {
      scall.addAll(fcall.sublist(i, fcall.length <= (i + 30) ? fcall.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getSChat(int i) {
    print("chat");
    if(i==0) {
      schat = [];
      fchat = selected==0 ? chat : chat.where((element) {
        if(element.status==CommonConstants.session_status[selected]) {
          return true;
        }
        return false;
      }).toList();
      update();
    }

    if(fchat.isNotEmpty && schat.length!=fchat.length) {
      schat.addAll(fchat.sublist(i, fchat.length <= (i + 30) ? fchat.length : (i + 30)));
      load = true;
      update();
    }
  }

  void getUpdate() {
    if(current==0) {
      if(tabController.index==0) {
        getSWallet(swallet.length);
      }
      else {
        getSPayment(spayment.length);
      }
    }
    else if(current==1) {
      getSCall(scall.length);
    }
    else if(current==2) {
      getSChat(schat.length);
    }
  }


  void changeSelected(int index) {
    if(selected!=index) {
      print(current);
      selected = index;
      update();

      if(current==1) {
        getSCall(0);
      }
      else {
        getSChat(0);
      }
    }
  }

}
