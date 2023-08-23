import 'dart:async';
import 'dart:developer';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:videosdk/videosdk.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CallController extends GetxController {
  CallController();

  final storage = GetStorage();

  final MeetingProvider meetingProvider = Get.find();


  CameraController? cameraController;
  late UserModel user;
  
  late String meetingID, token;
  late bool micEnabled, camEnabled, speakerEnabled;
  
  // Meeting
  late Room meeting;
  bool joined = false;
  late bool screen;

  // Streams
  Stream? shareStream;
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;
  late int seconds;
  late int max;
  late int ring;
  Timer? timer;
  late String type, action;
  late bool load;
  late bool show;
  late int ch_id;
  late String chat_type;
  late SessionHistoryModel sessionHistory;
  late double wallet;
  late tz.TZDateTime started_at;
  late tz.Location location;
  late int rate;

  int cnt = 0;

  late String sessionID;
  int? meet_id;
  
  @override
  void onInit() {
    user = Get.arguments['user'];
    meetingID = Get.arguments['meetingID'];
    // screen = Get.arguments['type']=="screen";
    type = Get.arguments['type'];
    action = Get.arguments['action'];

    tz.initializeTimeZones();
    location = tz.getLocation("GMT");
    micEnabled = true;
    camEnabled = false;
    speakerEnabled = false;
    sessionID = "";
    load = true;
    show = true;
    wallet = 0;
    seconds = 0;

    if (action == "VIEW" || action=="ACTIVE") {
      load = false;
      sessionHistory = Get.arguments['session_history'];
      ch_id = sessionHistory.id;
      // print("viewwww");
      // astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: 0, profile: "", about: "");

    }
    else {
      ch_id = Get.arguments['ch_id'];
      // chat_type = Get.arguments['chat_type'];
      sessionHistory = Get.arguments['session_history'];
      // sessionHistory = SessionHistoryModel(id: ch_id, sess_id: 0, status: type, rate: 0, commission: 0, type: chat_type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
    }
    start();
    super.onInit();

    // if(!screen) {
    //   accept();
    // }



  }

  void start() {
    print(action);
    if(action == "VIEW") {
      getSessionHistory();
    }
    else {
      initializeMeeting();
      // initCameraPreview();
      //
      // SystemChrome.setPreferredOrientations([
      //   DeviceOrientation.portraitUp,
      //   DeviceOrientation.portraitDown,
      // ]);
    }
  }
  void initializeMeeting() {
    print(type);
    print(action);
    if(type=="REQUESTED") {
      if(action=="ACCEPT") {
        accept();
      }
      else if(action=="NOT DECIDED"){
        ch_id = sessionHistory.id;
        token = sessionHistory.token??"";
        meetingID = sessionHistory.meeting_id??"";
        sessionID = sessionHistory.session_id??"";
        rate = sessionHistory.rate;
        startRing(60);
      }
    }
    else if(type=="ACTIVE"){
      getSessionHistory();
    }
    else if(type=="RECONNECT"){
      if(action=="RECONNECTING") {
        rate = sessionHistory.rate;
        validateMeeting("RECONNECTING");
        // startRing(10);
        startRing(65);
      }
    }
  }

  void startRing(int time) {
    ring = time;
    update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setRing();
    });
    update();
  }

  void setRing() {
    print(ring);
    ring-=1;
    update();
    if(ring<=0) {
      stopTimer();
      if(type=="REQUESTED") {
        print("waitlist");
        waitlistCall();
      }
      else {
        print("missed");
        // missedChat();
      }
    }
  }

  void startTimer() {
    // var gmt = tz.getLocation('GMT');
    // tz.TZDateTime now = tz.TZDateTime.now(gmt);
    // Duration duration = now.difference(started_at);
    // print("startedddddd");
    // print(now);
    // print(started_at);
    // print(duration);
    // seconds = duration.inSeconds;
    // update();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    update();
  }


  void setCountDown() {
    seconds+=1;
    update();
    print(max);
    print(seconds);
    if(max<=seconds) {
      print("enddd");
      // endMeeting();
    }
  }

  void stopTimer() {
    if(timer!=null) {
      timer!.cancel();
      update();
    }
  }

  void accept() {
    print("accept");
    stopTimer();
    screen = true;
    micEnabled = true;
    camEnabled = false;
    speakerEnabled = false;
    update();
    initCameraPreview();
    print("accepteddddd");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    validateMeeting("ACTIVE");
  }

  void cancelMeeting() async {
    if(timer!=null) {
      stopTimer();
    }

    if(ch_id!=null) {
      Map<String, dynamic> data = {
        SessionConstants.ch_id : ch_id,
        SessionConstants.sender : "A",
        SessionConstants.reason : "Chat was cancelled by astrologer",
      };
      if(storage.read("calling")!=null) {
        storage.remove("calling");
      }

      await meetingProvider.cancel(data, storage.read("access")).then((response) async {
        if(response.code==1) {
          type = "CANCELLED";
          update();
        }
        else if(response.code!=-1) {
          Essential.showSnackBar(response.message);
        }
        else {
          Essential.showSnackBar(response.message);
        }
      });
      storage.remove("calling");
      Get.back();
    }
  }


  void endMeeting(String status) {
    try {
      print("endddd");
      if (timer != null) {
        stopTimer();
      }
      type = status;
      update();
      print("Recordingggggg : Stop endd meetingggg");
      meeting.stopRecording();
      meeting.end();
      getSessionHistory();
    }
    catch(ex) {
      print(ex);
    }
  }

  void initCameraPreview() {
    // Get available cameras
    availableCameras().then((availableCameras) {
      // stores selected camera id
      int selectedCameraId = availableCameras.length > 1 ? 1 : 0;

      cameraController = CameraController(
        availableCameras[selectedCameraId],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      log("Starting Camera");
      cameraController!.initialize().then((_) {
        update();
      });
    }).catchError((err) {
      log("Error: $err");
    });
  }


  void updateMic() {
    // micEnabled = !micEnabled;
    if (audioStream != null) {
      meeting.muteMic();
      micEnabled = true;
    } else {
      meeting.unmuteMic();
      micEnabled = false;
    }
    update();
  }

  void updateCamera() {
    // camEnabled = !camEnabled;
    if (videoStream != null) {
      meeting.disableCam();
      camEnabled = false;
    } else {
      meeting.enableCam();
      camEnabled = true;
    }
    update();
  }


  void updateSpeaker() {
    List<MediaDeviceInfo> outputDevices = meeting.getAudioOutputDevices();
    for (var element in outputDevices) {
      if(speakerEnabled) {
        if(element.deviceId!="speaker") {
          meeting.switchAudioDevice(element);
          speakerEnabled = false;
          update();
          break;
        }
      }
      else {
        if(element.deviceId=="speaker") {
          meeting.switchAudioDevice(element);
          speakerEnabled = true;
          update();
          break;
        }
      }
    }
  }


  Future<void> validateMeeting(String type) async {
    Map<String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.meetingID : meetingID,
      SessionConstants.type : type,
      SessionConstants.sender : "A",
    };

    await meetingProvider.validate(data, storage.read("access")).then((response) async {
      print("response.toJson()");
      print(response.toJson());
      if(response.code==1) {
        token = response.token??"";
        update();
        joinRoom();
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });

    // token = await fetchToken();
    // print(token);
    // meetingID = await createMeeting(token);
    // update();
  }

  joinRoom() {
    print("joinnnnnn");
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // Create instance of Room (Meeting)
      meeting = VideoSDK.createRoom(
        roomId: meetingID,
        token: token,
        displayName: user.name,
        micEnabled: micEnabled,
        camEnabled: camEnabled,
        maxResolution: 'hd',
        multiStream: false,
        defaultCameraIndex: 1,
        notification: const NotificationInfo(
          title: "Video SDK",
          message: "Video SDK is sharing screen in the meeting",
          icon: "notification_share", // drawable icon name
        ),
      );

      update();
      print("register before");
      registerMeetingEvents(meeting);
      print("register after");
      // Register meeting events

      // Join meeting
      print("meeting before");
      meeting.join();
      print("meeting after");
      stopTimer();
      print("time after");
      update();
      print(type);
      print("type after");
    } catch (error) {

      print("error");
      print(meeting);
      print(error);

      //showSnackBarMessage(message: error.toString(), context: context);
      Essential.showSnackBar("Errorrrr: ${error.toString()}");
    }
  }


  void registerMeetingEvents(Room meeting) {
    meeting.on(
      Events.roomJoined,
          () {
        print("room joineddddd");
        if (meeting.participants.length > 1) {
          // this.meeting = meeting;
          stopTimer();
          joined = true;
          seconds = 0;
          type = "ACTIVE";
          calculateCountdown();
          update();
          startTimer();

          update();
          Map<String, dynamic> config = {
            "layout": {
              "type": "GRID",
              "priority": "SPEAKER",
              "gridSize": 4,
            },
            "theme": "DARK",
            "mode": "video-and-audio",
            "quality": "high",
            "orientation": "portrait",
          };

          print("Recordingggggg : Start Joined");
          meeting.startRecording(config: config);

        } else {
          // this.meeting = meeting;
          // update();
        }
      },
    );


    meeting.on(
      Events.participantJoined,
          (Participant participant) {
            print("ssweb: participant joined");
            stopTimer();
            joined = true;
            seconds = 0;
            type = "ACTIVE";
            calculateCountdown();
            update();
            startTimer();
            Map<String, dynamic> config = {
              "layout": {
                "type": "GRID",
                "priority": "SPEAKER",
                "gridSize": 4,
              },
              "theme": "DARK",
              "mode": "video-and-audio",
              "quality": "high",
              "orientation": "portrait",
            };
            print("Recordingggggg : Start Participant Joined");
            meeting.startRecording(config: config);
      },
    );

    meeting.on(
      Events.participantLeft,
          (Participant participant) {
        if(joined) {
          print("Recordingggggg : Stop Participant Left");
          meeting.stopRecording();
          meeting.end();
        }
      },
    );


    meeting.on(
      Events.recordingStateChanged,
          (String status) {
            print("Recordingggggg : State Changed - "+status);
      },
    );



    // Called when meeting is ended
    meeting.on(Events.roomLeft, (String? errorMsg) {
      if (errorMsg != null) {
        Essential.showSnackBar("Meeting left due to $errorMsg !!");
      }

      // Get.back();
    });


    // Called when stream is enabled
    meeting.localParticipant.on(Events.streamEnabled, (Stream _stream) {
      if (_stream.kind == 'video') {
        videoStream = _stream;
      } else if (_stream.kind == 'audio') {
        audioStream = _stream;
      } else if (_stream.kind == 'share') {
        shareStream = _stream;
      }
      update();
    });

    // Called when stream is disabled
    meeting.localParticipant.on(Events.streamDisabled, (Stream _stream) {
      if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
        videoStream = null;
      } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
        audioStream = null;
      } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
        shareStream = null;
      }
    });

    // Called when presenter is changed
    meeting.on(Events.presenterChanged, (_activePresenterId) {
      Participant? activePresenterParticipant =
      meeting.participants[_activePresenterId];

      // Get Share Stream
      Stream? _stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      remoteParticipantShareStream = _stream;
      update();
    });

    meeting.on(
        Events.participantLeft,
            (participant) => {
          if (meeting.participants.length < 2)
            {
              joined = true,
              update(),
              subscribeToChatMessages(meeting),
            }
        });


    meeting.on(
        Events.error,
            (error)  {
          print(error);
          Essential.showSnackBar("${error['name']} :: ${error['message']}");
        });
  }


  void subscribeToChatMessages(Room meeting) {
    meeting.pubSub.subscribe("CHAT", (message) {
      if (message.senderId != meeting.localParticipant.id) {
         Essential.showSnackBar("${message.senderName}: ${message.message}",);
      }
    });
  }

  Future<bool> onWillPopScope() async {
    print("leave");
    print("leavee");
    if(joined) {
      meeting.leave();
    }
    return true;
  }



  void reject() async {
    if(timer!=null) {
      stopTimer();
    }
    Map <String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Chat was rejected by astrologer",
    };

    if(storage.read("calling")!=null) {
      storage.remove("calling");
    }

    await meetingProvider.reject(data, storage.read("access")).then((response) async {
      if(response.code==1) {
        type = "REJECTED";
        update();
      }
      else if(response.code!=-1) {
        Essential.showSnackBar(response.message);
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
    storage.remove("calling");
    Get.back();
  }

  void updateFullScreen() {
    fullScreen = !fullScreen;
    update();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }


  Future<void> getSessionHistory() async {
    Map <String, String> data = {
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "A",
      SessionConstants.user_id : user.id.toString(),
    };


    await meetingProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.session_history?.toJson());
      if(response.code==1) {
        user = response.user ?? user;
        sessionHistory = response.session_history ?? sessionHistory;
        wallet = response.wallet ?? 0;

        cnt = 0;
        print(sessionHistory.started_at);
        started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at ?? ""}+0000");
        rate = sessionHistory.rate;
        chat_type = sessionHistory.type;
        token = sessionHistory.token??"";
        meetingID = sessionHistory.meeting_id??"";
        load = false;

        if (type == "ACTIVE") {
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

          joinRoom();

          startTimer();
          load = true;
          update();
        }
        else {
          load = true;
          update();
        }
      }
      else {
        load = true;
        update();
      }

    });
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

  void end(bool auto) async {
    if(timer!=null) {
      stopTimer();
    }


    Map<String, dynamic> data = {
      // SessionConstants.meetingID: meetingID,
      // SessionConstants.sessionID: sessionID,
      SessionConstants.sender: "A",
      SessionConstants.ch_id: ch_id.toString(),
      SessionConstants.reason : auto ? "Call was ended automatically due to low wallet balance" : "Astrologer ended the call",
      CommonConstants.seconds : seconds,
    };
    print("ssweb: "+data.toString());

    if(storage.read("calling")!=null) {
      storage.remove("calling");
    }

    await meetingProvider.end(data, storage.read("access")).then((response) async {
      print("ssweb: response.toJson()");
      print(response.toJson());
      if (response.code == 1) {
        print("Recordingggggg : Stop End");
        meeting.stopRecording();
        meeting.end();
        storage.remove("calling");
        // back();
      }
      else if (response.code == -2) {}
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }


  void waitlistCall() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "Astrologer missed the call and it is shifted to WAITLIST",
    };

    print(data);

    if(storage.read("calling")!=null) {
      storage.remove("calling");
    }

    await meetingProvider.waitlist(data, storage.read("access")).then((response) async {
      print(response.toJson());
      if(timer!=null) {
        stopTimer();
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
        Essential.showSnackBar(response.message);
      }
    });
  }

  void storeCalling(CallController callController) {
    print("storeeeeeee");
    storage.write("calling", callController);
  }

  void back() {
    if(timer!=null) {
      stopTimer();
    }
    Get.back();
  }
}
