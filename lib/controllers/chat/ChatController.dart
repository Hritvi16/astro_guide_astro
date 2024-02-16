import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/dialogs/RatingDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/chat/ChatResponseModel.dart';
import 'package:astro_guide_astro/models/chat/CheckChatResponseModel.dart';
import 'package:astro_guide_astro/models/chat/EndChatResponseModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/ChatProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/views/quickReply/QuickReply.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart' as r;
import 'package:just_audio/just_audio.dart' as p;

class ChatController extends GetxController {
  ChatController();

  final storage = GetStorage();

  final ChatProvider chatProvider = Get.find();
  ScrollController controller = ScrollController();


  int recordDuration = 0;
  Timer? recordTimer;
  late r.Record audioRecorder;
  StreamSubscription<r.RecordState>? recordSub;
  r.RecordState recordState = r.RecordState.stop;
  StreamSubscription<r.Amplitude>? amplitudeSub;
  r.Amplitude? amplitude;

  Duration? position;
  Duration? duration;



  // late SessionHistoryModel sessionHistory;

  List<ChatModel> chats = [];

  TextEditingController message = TextEditingController();

  late bool send;
  int id = -1;

  late IO.Socket socket;
  late UserModel user;
  late int ch_id;
  late String type;
  late String action;
  late bool cancel;
  late bool reject;

  int cnt = 0;

  static Timer? timer;
  static String? timer_type;
  late tz.TZDateTime started_at;
  late int seconds;
  late tz.Location location;
  late double amount;
  late bool auto;

  late int max;
  late int rate;
  late String chat_type;
  late bool show;
  late bool load;

  late int ring;
  late SessionHistoryModel sessionHistory;
  ReviewModel? review;
  late double wallet;

  final player = p.AudioPlayer();
  late ImageProvider imageProvider;

  late List<QuickRepliesModel> replies;


  late bool recording;
  late String playerUrl;

  @override
  void onInit() {
    super.onInit();
    print("hellooo init");
    initAudio();
    cancel = false;
    reject = false;
    recording = false;
    load = true;
    playerUrl = "";
    seconds = 0;
    wallet = 0;
    replies = [];

    tz.initializeTimeZones();
    location = tz.getLocation("GMT");
    ch_id = Get.arguments['ch_id'];
    type = Get.arguments['type'];
    action = Get.arguments['action'];
    if(Get.arguments['wallet']!=null) {
      wallet = Get.arguments['wallet'];
    }

    // sessionHistory = Get.arguments;
    send = false;
    show = true;
    max = 0;

    if (action == "VIEW") {
      load = false;
      print(Get.arguments);
      sessionHistory = Get.arguments['session_history'];
      user = UserModel(id: Get.arguments['user_id'], name: "", profile: '', mobile: '', );
    }
    else {
      sessionHistory = SessionHistoryModel(id: id, sess_id: 0, status: type, category: "CHAT", rate: 0, commission: 0, type: type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
      user = Get.arguments['user'];
    }

    if((user.profile??"").isNotEmpty) {
      imageProvider = NetworkImage(
          ApiConstants.userUrl+(user.profile??"")
      );
    }
    else {
      imageProvider = AssetImage(
          "assets/sign_up/profile.png"
      );
    }
    start();
  }

  void initAudio() {
    getMyQuickReplies();
    audioRecorder = r.Record();

    recordSub = audioRecorder.onStateChanged().listen((recordState) {
      updateRecordState(recordState);
    });

    amplitudeSub = audioRecorder
        .onAmplitudeChanged(const Duration(milliseconds: 300))
        .listen((amp) {
      amplitude = amp;
      update();
    });
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecorder.hasPermission()) {
        const encoder = r.AudioEncoder.wav;

        // We don't do anything with this but printing
        final isSupported = await audioRecorder.isEncoderSupported(
          encoder,
        );

        debugPrint('${encoder.name} supported: $isSupported');

        final devs = await audioRecorder.listInputDevices();
        debugPrint(devs.toString());

        // const config = RecordConfig(encoder: encoder, numChannels: 1);

        // Record to file
        String path;
        final dir = await getApplicationDocumentsDirectory();
        path = join(
          dir.path,
          '${sessionHistory.id}_audio_${DateTime.now().millisecondsSinceEpoch}.m4a',
        );
        await audioRecorder.start(path: path);

        recordDuration = 0;
        recording = true;
        update();

        startRecordTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<void> stopRecording(bool send) async {
    final path = await audioRecorder.stop();

    if(send) {
      if (path != null) {
        sendVoice(path);
      }
    }
    else {
      print("delete");
      File file = File(path!);
      await file.delete();
    }



    // Simple download code for web testing
    // final anchor = html.document.createElement('a') as html.AnchorElement
    //   ..href = path
    //   ..style.display = 'none'
    //   ..download = 'audio.wav';
    // html.document.body!.children.add(anchor);

    // // download
    // anchor.click();

    // // cleanup
    // html.document.body!.children.remove(anchor);
    // html.Url.revokeObjectUrl(path!);
  }

  Future<void> pause() => audioRecorder.pause();

  Future<void> resume() => audioRecorder.resume();

  void updateRecordState(r.RecordState recordState) {
    this.recordState = recordState;
    update();

    switch (recordState) {
      case r.RecordState.pause:
        recordTimer?.cancel();
        break;
      case r.RecordState.record:
        startRecordTimer();
        break;
      case r.RecordState.stop:
        recordTimer?.cancel();
        recordDuration = 0;
        update();
        break;
    }
  }

  void startRecordTimer() {
    recordTimer?.cancel();

    recordTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      recordDuration++;
      update();
    });
  }


  start() {
    print(action);
    if(action=="VIEW") {
      getSessionHistory();
    }
    else {
      initializeSocket();
    }
  }

  initializeSocket() async {
    socket = IO.io(
      ApiConstants.urlS,
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {
            SessionConstants.username : storage.read("access"),
            SessionConstants.ch_id : ch_id,
            SessionConstants.sender : "A",
            SessionConstants.user_id : user.id,
          }).build(),
    );
    connectSocket();

    if(type=="REQUESTED") {
      if(action=="ACCEPT") {
        initiateChat();
      }
      else if(action=="NOT DECIDED"){
        print("ssweb: not decided");
        bool? go = await getSessionHistory();
        print("ssweb:gooo ${go}");

        if(go==true) {
          Get.back();
          Essential.showSnackBar(sessionHistory.reason??"Chat hs been ${sessionHistory.status}");
        }
        else {
          startRing(60);
        }
      }
    }
    else if(type=="ACTIVE"){
      getSessionHistory();
    }
    else if(type=="RECONNECT") {
      if(action=="RECONNECTING") {
        // startRing(10);
        startRing(65);
      }
    }
  }

  Future<void> getMyQuickReplies() async {
    print(storage.read("access"));
    chatProvider.fetchQuickReplies(storage.read("access"), ApiConstants.quickReplies+ApiConstants.active).then((response) {
      print(response.toJson());
      if (response.code == 1) {
        replies = [];
        replies.addAll(response.data ?? []);
      }
      load = true;
      update();
    });
  }

  Future<bool?> getSessionHistory() async {
    Map <String, String> data = {
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "A",
      SessionConstants.user_id : user.id.toString(),
    };


    return await chatProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        chats.addAll(response.data??[]);
        user = response.user??user;
        update();
        if((user.profile??"").isNotEmpty) {
          imageProvider = NetworkImage(
              ApiConstants.userUrl+(user.profile??"")
          );
        }
        else {
          imageProvider = AssetImage(
              "assets/sign_up/profile.png"
          );
        }
        sessionHistory = response.session_history ?? sessionHistory;

        if(sessionHistory.status=="REJECTED" || sessionHistory.status=="WAITLISTED" || sessionHistory.status=="CANCELLED") {
          // stopTimer();
          update();
          return true;
        }
        else if(sessionHistory.status=="REQUESTED") {
          load = true;
          return false;
        }

        wallet = response.wallet??0;
        review = response.review;
        load = false;
          print("sessionHistory.toJson()");
        print(sessionHistory.toJson());


        started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at??""}+0000");
        cnt = 0;
        // started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at??""}+0000");
        rate = sessionHistory.rate;
        chat_type = sessionHistory.type;

        print(sessionHistory.status);


        if(type=="ACTIVE") {
          if (chat_type == "FREE") {
            show = false;
            update();
            max = 600;
          }
          else {
            show = true;
            update();
            calculateCountdown();
          }
          startTimer();
        }
      }
      load = true;
      update();

      return null;

    });
  }

  Future<void> getChats(int offset) async {
    String query = "";
    // if(search.text.isNotEmpty) {
    //   query = "UPPER(a.name) LIKE '%${search.text.toUpperCase()}%'";
    //   if(spec.id==-1) {
    //     query = " WHERE ${query}";
    //   }
    //   else {
    //     query = " AND ${query}";
    //   }
    // }

    Map <String, dynamic> data = {
      ApiConstants.offset : offset.toString(),
      ApiConstants.search : query,
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.user_id : user.id,
    };


    await chatProvider.fetchByID(storage.read("access"), ApiConstants.history, data).then((response) async {
      if(response.code==1) {
        if(offset==0) {
          chats = [];
        }
        chats.addAll(response.data??[]);
      }
      load = true;
      update();

    });
  }

  // sendMessage() {
  //   socket.emit('message', {
  //     'message': message.text.trim(),
  //     'sender': "user2"
  //   });
  //   message.clear();
  // }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.on(
      'initiate', (data) async {
      CheckChatResponseModel checkChatResponse = CheckChatResponseModel.fromJson(json.decode(data));

      if(checkChatResponse.code==1) {
        stopTimer(false);
        type = "ACTIVE";

        cnt = 0;

        load = false;
        started_at = tz.TZDateTime.parse(location, "${checkChatResponse.started_at??""}+0000");
        cnt = 0;
        started_at = tz.TZDateTime.parse(location, "${checkChatResponse.started_at??""}+0000");
        rate = checkChatResponse.rate??0;
        chat_type = checkChatResponse.type??"PAID";
        if(chat_type=="FREE") {
          show = false;
          update();
          max = 600;
        }
        else {
          show = true;
          update();
          calculateCountdown();
        }
        // started_at = DateTime.parse(checkChatResponse.started_at??"");
        print("--------------------------------------------------------------------------------");
        // startTimer();
        print("-----------------------------================-----------------------------------");
        getSessionHistory();

      }
      else if(checkChatResponse.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(checkChatResponse.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              initiateChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    },
    );

    socket.on(
        'reject', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      print(response.toJson());

      if(timer!=null) {
        stopTimer(true);
      }

      if(response.code==1) {
        cnt = 0;
        type = "REJECTED";
        if(reject==false) {
          // stopTimer();
          back();
        }
        else {
          update();
        }
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3 && reject) {
              rejectChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
        'end', (data) async {
      EndChatResponseModel endChatResponse = EndChatResponseModel.fromJson(json.decode(data));

      if(timer!=null) {
        stopTimer(true);
      }

      if(endChatResponse.code==1) {
        cnt = 0;
        type = "COMPLETED";
        action = "COMPLETED";
        amount = endChatResponse.amount??0;
        stopTimer(true);
      }
      else if(endChatResponse.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(endChatResponse.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              endChat(auto);
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
        'missed', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      if(timer!=null) {
        stopTimer(true);
      }

      print(response.toJson());

      if(response.code==1) {
        cnt = 0;
        type = "MISSED";
        update();
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              // waitlistChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
        'cancel', (data) async {
      EndChatResponseModel endChatResponse = EndChatResponseModel.fromJson(json.decode(data));

      print("ssweb cancellll");
      print(endChatResponse.toJson());


      if(endChatResponse.code==1) {
        cnt = 0;
        type = "CANCELLED";

        if(timer!=null) {
          stopTimer(true);
        }
        if(cancel==false) {
          // stopTimer();
          back();
        }
        else {
          update();
        }
      }
      else if(endChatResponse.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(endChatResponse.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true && cancel) {
            if(cnt<=3) {
              cancelChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
        'waitlist', (data) async {
      ResponseModel response = ResponseModel.fromJson(json.decode(data));

      print(response.toJson());

      if(timer!=null) {
        stopTimer(true);
      }

      if(response.code==1) {
        cnt = 0;
        type = "WAITLISTED";
        update();
        back();
      }
      else if(response.code!=-1) {
        cnt = 0;
        Essential.showSnackBar(response.message);
      }
      else {
        await Essential.getNewAccessToken().then((value) async {
          cnt++;
          update();
          if(value==true) {
            if(cnt<=3) {
              // waitlistChat();
            }
            else {
              Essential.logout();
            }
          }
          else {
            Essential.logout();
          }
        });
      }
    }
    );

    socket.on(
      'message',
          (data) {
        print("dataaaaa");
        print(data);
        ChatResponseModel chatResponseModel = ChatResponseModel.fromJson(json.decode(data));

        List<ChatModel> temp = [
          chatResponseModel.data!
        ];
        temp.addAll(chats);
        chats = temp;
        update();
        // controller.jumpTo(controller.position.minScrollExtent);
      },
    );
    socket.on(
      'self',
          (data) {
        ChatResponseModel chatResponseModel = ChatResponseModel.fromJson(json.decode(data));

        for (int i=0; i<chats.length; i++) {
          if(chats[i].id==chatResponseModel.m_id) {
            if(chatResponseModel.code==1) {
              chats[i] = chatResponseModel.data!;
            }
            else {
              chats[i] = chats[i].copyWith(error: 1);
            }
            update();
            break;
          }
        }
      },
    );
  }

  Future<void> initiateChat() async {
    stopTimer(false);
    action = "ACCEPT";
    update();

    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
    };

    socket.emit('initiate', data);
  }

  Future<void> sendText() async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.user_id : user.id,
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : SessionConstants.A,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.message : message.text,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "T",
    };

    sendMessage(data, "");
  }

  Future<void> sendQuickReply(String message) async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.user_id : user.id,
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : SessionConstants.A,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.message : message,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "T",
    };

    print("dataaaa");
    print(data['message']);
    sendMessage(data, "");
  }

  Future<void> sendMessage(Map <String, dynamic> data, String path) async {

    List<ChatModel> temp = [
      ChatModel(id: id--, ch_id: ch_id, message: data['m_type']=="T" ? message.text : path, sender: SessionConstants.A, type: SessionConstants.M, m_type: data['m_type'], sent_at: DateTime.now().toString())
    ];

    temp.addAll(chats);
    chats = temp;
    message.text = "";
    send = false;
    update();
    try {
      controller.jumpTo(controller.position.minScrollExtent);
    }
    catch(ex) {

    }

    if(data['m_type']=="T") {
      socket.emit('message', data);
      print(data);
      print("emittttteddd");
      message.clear();
    }
    else {
      sendFile(data);
    }

    // await chatProvider.send(storage.read("access"), ApiConstants.send, data).then((response) async {
    //   if(response.code==1) {
    //     for (int i=0; i<chats.length; i++) {
    //       if(chats[i].id==temp_id) {
    //         chats[i] = response.data!;
    //         update();
    //         break;
    //       }
    //     }
    //   }
    //   else {
    //   }
    // });
  }

  void sendFile(Map <String, dynamic> data) async {
    late FormData form = FormData(data);

    print(data);

    await chatProvider.send(form, storage.read("access")).then((response) async {
      if(response.code==1) {
        ChatResponseModel chatResponseModel = response;

        Map <String, dynamic> broadcast = chatResponseModel.toJson();
        broadcast.addAll({
          SessionConstants.username : storage.read("access"),
          SessionConstants.sender : "A",
        });

        print("broadcast");
        print(broadcast);
        socket.emit('broadcastFile', broadcast);
        print("emiteddd");

        for (int i=0; i<chats.length; i++) {
          if(chats[i].id==chatResponseModel.m_id) {
            if(chatResponseModel.code==1) {
              chats[i] = chatResponseModel.data!;
            }
            else {
              chats[i] = chats[i].copyWith(error: 1);
            }
            update();
            break;
          }
        }

      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  @override
  void dispose() {
    disposeObjects();
    super.dispose();
  }

  void goto(String page, {dynamic? arguments}) {
    Get.toNamed(page, arguments: arguments);
  }

  getSeenStatus(ChatModel chat) {
    if(chat.seen_at!=null) {
      return 2;
    }
    else if(chat.received_at!=null) {
      return 1;
    }
    else {
      if(chat.id<0) {
        return -1;
      }
      return 0;
    }
  }

  void calculateCountdown() {
    max = 0;
    int minutes = (wallet/rate).floor();
    if(minutes>0) {
      max = minutes * 60;
    }
    double rem = wallet%rate;

    if(rem!=0) {
      double perSecRate = (rate/60).toPrecision(2);
      if(rem>=perSecRate) {
        int secs = (rem/perSecRate).floor();
        max+=secs;
      }
    }
    update();
  }

  void changeSend() {
    if(message.text.isEmpty) {
      send = false;
      update();
    }
    else {
      if(!send) {
        send = true;
        update();
      }
    }
  }

  void cancelChat() async {
    print("chat cancelled");
    print(timer);
    if(timer!=null) {
      stopTimer(true);
    }
    cancel = true;
    update();

    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Chat was cancelled by astrologer",
    };

    socket.emit('cancel', data);
    back();

  }

  void rejectChat() async {
    print("chat rejected");
    stopTimer(false);
    reject = true;
    update();
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Chat was rejected by astrologer",
    };


    socket.emit('reject', data);
    back();
  }

  void endChat(bool auto) async {
    this.auto = auto;
    update();
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : auto ? "Chat was ended automatically due to low wallet balance" : "Astrologer ended the chat",
      CommonConstants.seconds : seconds,
    };

    socket.emit('end', data);
  }

  void waitlistChat() async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Astrologer missed the chat and it is shifted to WAITLISTED",
    };

    socket.emit('waitlist', data);
  }

  void startTimer() {
    var kolkata = tz.getLocation('GMT');
    Duration duration = tz.TZDateTime.now(kolkata).difference(started_at);
    seconds = duration.inSeconds;
    update();

    if(timer==null || (timer!=null && timer_type=="ring")) {
      timer_type = "chat";
      timer = Timer.periodic(Duration(seconds: 1), (_) {setCountDown();});
    }

    update();
  }

  void startRing(int time) {
    ring = time;

    if(type=="REQUESTED") {
      player.setAsset("assets/audio/notification.mp3");
      player.play();
      player.processingStateStream.listen((processingState) {
        if (processingState == ProcessingState.completed &&
            type == "REQUESTED") {
          player.seek(Duration.zero);
          player.play();
          update();
          print("completed");
        }
      });
    }
    update();
    timer_type = "ring";
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setRing();
    });
    update();
  }

  void setCountDown() {
    seconds+=1;
    update();
    if(max<=seconds) {
      endChat(true);
    }
  }

  void setRing() {
    print(ring);
    ring-=1;
    update();
    if(ring<=0) {
      stopTimer(false);
      print(type);
      if(type=="REQUESTED") {
        waitlistChat();
      }
      else {
        missedChat();
      }
    }
  }

  void missedChat() async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "User missed the chat.",
    };

    socket.emit('missed', data);
  }

  String getChatTime() {
    // return "${seconds} secs";
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  String getTime(int seconds) {
    // return "${seconds} secs";
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    String hoursStr = "";
    if(hours>0) {
      hoursStr = hours.toString().padLeft(2, '0')+":";
    }
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr$minutesStr:$secondsStr';
  }

  void manageReply() {
    Get.dialog(
      RatingDialog(
        review: review!,
      ),
      barrierDismissible: true,
    ).then((value) {
      if(value!=null) {
        review = value;
        update();
        Essential.showSnackBar("Thank you for your reply");
      }
    });
  }

  void confirmDelete() {
    Get.dialog(
      const BasicDialog(
        text: "Are you sure you want to delete your rating?",
        btn1: "Yes",
        btn2: "No",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Yes") {
        deleteReply();
      }
    });
  }

  Future<void> deleteReply() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : review?.id,
      SessionConstants.reply : null,
    };

    print(data);

    await chatProvider.manage(storage.read("access"), ApiConstants.rating+ApiConstants.reply, data).then((response) async {
      if(response.code==1) {
        review = review?.copyWith(reply: null, replied_at: null);
        update();
        Essential.showSnackBar("Review Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Future<void> sendVoice(String path) async {
    Map <String, dynamic> data = {
      SessionConstants.username : storage.read("access"),
      SessionConstants.user_id : user.id,
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : SessionConstants.A,
      SessionConstants.type : SessionConstants.M,
      SessionConstants.m_id : id.toString(),
      SessionConstants.m_type : "V",
    };


    if (path.isNotEmpty) {
      File file = File(path);
      // List<int> fileBytes = await file.readAsBytes();

      data.addAll({SessionConstants.message : MultipartFile(File(file!.path), filename: basename(path)), SessionConstants.ext : basename(path).substring(basename(path).lastIndexOf(".")+1)});
      // data.addAll({SessionConstants.message : fileBytes, SessionConstants.ext : image.name.substring(image.name.lastIndexOf(".")+1)});
      print("dataaaaaa");
      print(basename(path));
      sendMessage(data, file.path);
    }
  }

  void stopTimer(bool dispose) {
    if(player.playing) {
      player.stop();
    }
    if(timer!=null) {
      timer!.cancel();
      update();
    }

    if(dispose) {
      disposeObjects();
    }
  }

  void back() {
    disposeObjects();
    Get.back();
  }

  void manageQR(bool value) {
    Get.bottomSheet(
        isScrollControlled: true,
        QuickReply(replies)
    ).then((value) {
      print("valueeee");
      print(value);

      if(value!=null){
        replies = value['replies']??replies;
        update();
        if(value['send']==true) {
          sendQuickReply(value['reply']);
        }
      }
    });
  }

  void disposeObjects() {
    print("disposeeee objectsss");
    timer = null;
    timer_type = null;
    update();
    print(timer);
    recordTimer?.cancel();
    recordSub?.cancel();
    amplitudeSub?.cancel();
    audioRecorder.dispose();
    // message.dispose();
    try {
      if(player!=null) {
        print("disposeddd it");
        player.dispose();
      }
      else {
        print("disposeddd");
      }
    }
    catch(ex) {
      print("disposeddd erroeee");
    }
    Future.delayed(const Duration(seconds: 3), () {
      socket.close();
      socket.dispose();
    });
  }

  void recordingAction() {
    if(recording) {
      stopRecording(true);
      recording = false;
      update();
    }
    else {
      startRecording();
    }
  }

  void playAudio(String url) {
    print(url);
    try {
      if(url!=playerUrl) {
        player.setUrl(url);
        player.play();
        player.processingStateStream.listen((processingState) {
          print("processingState");
          print(processingState);
          if (processingState == ProcessingState.completed) {
            // player.seek(Duration.zero);
            player.stop();
            update();
            print("completed");
          }
        });
        playerUrl = url;
      }
      else {
        if(player.processingState==ProcessingState.ready) {
          player.play();
        }
        else {
          player.seek(Duration.zero);
          player.play();
        }
      }
      // audioPlayer.play(UrlSource(url));
    }
    catch(ex) {
      print("errorrr");
      print(ex);
    }
    update();
  }

  void pauseAudio() {
    player.pause();
    // playerUrl = "";
    update();
  }
}
