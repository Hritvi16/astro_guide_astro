import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/controllers/GlobalVariables.dart';
import 'package:astro_guide_astro/dialogs/BasicDialog.dart';
import 'package:astro_guide_astro/dialogs/RatingDialog.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/meeting/EndCallResponseModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/notifier/GlobalNotifier.dart';
import 'package:astro_guide_astro/providers/MeetingProvider.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videosdk/videosdk.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:just_audio/just_audio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CallController extends GetxController {
  CallController();

  final storage = GetStorage();

  late MeetingProvider meetingProvider = Get.find();


  CameraController? cameraController;
  late UserModel user;
  
  late String meetingID, token;
  late bool micEnabled, camEnabled, speakerEnabled;
  
  // Meeting
  Room? meeting;
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
  static Timer? timer;
  late String type, action;
  late bool load;
  late bool show;
  late int ch_id;
  late String chat_type;
  late SessionHistoryModel sessionHistory;
  ReviewModel? review;
  late double wallet;
  late tz.TZDateTime started_at;
  late tz.Location location;
  late int rate;

  int cnt = 0;

  late String sessionID;
  int? meet_id;
  final player = AudioPlayer();


  late IO.Socket socket;
  late Directory directory;

  final GlobalNotifier globalNotifier = Get.find();

  @override
  void onInit() {
    globalNotifier.updateCallInit(true);
    print("Get.arguments");
    print(Get.arguments);
    print(Get.routing.previous);
    rate = 0;
    wallet = 0;
    seconds = 0;

    if(Get.arguments!=null) {
      user = Get.arguments['user'];
      meetingID = Get.arguments['meetingID'];
      // screen = Get.arguments['type']=="screen";
      type = Get.arguments['type'];
      action = Get.arguments['action'];
      load = true;

      if (Get.arguments['wallet'] != null) {
        wallet = Get.arguments['wallet'];
      }
    }
    else {
      user = UserModel(id: -1, name: " ", mobile: "0", );
      load = false;
    }

    tz.initializeTimeZones();
    location = tz.getLocation("GMT");
    micEnabled = false;
    camEnabled = false;
    speakerEnabled = false;
    sessionID = "";
    show = true;

    if(Get.arguments!=null) {
      if (action == "VIEW" || action == "ACTIVE") {
        load = false;
        sessionHistory = Get.arguments['session_history'];
        ch_id = sessionHistory.id;
        // print("ssweb: viewwww");
        // astrologer = AstrologerModel(id: Get.arguments['astro_id'], name: "", mobile: "", email: "", experience: 0, profile: "", about: "");

      }
      else {
        ch_id = Get.arguments['ch_id'];
        // chat_type = Get.arguments['chat_type'];
        sessionHistory = Get.arguments['session_history'];
        // sessionHistory = SessionHistoryModel(id: ch_id, sess_id: 0, status: type, rate: 0, commission: 0, type: chat_type, requested_at: DateTime.now().toString(), updated_at: DateTime.now().toString());
      }
      start();
    }
    super.onInit();

    // if(!screen) {
    //   accept();
    // }



  }

  Future<void> start() async {
    directory = await getApplicationDocumentsDirectory();
    update();
    print("ssweb: action $action");
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
  Future<void> initializeMeeting() async {
    // socket = IO.io(
    //   ApiConstants.urlES,
    //   IO.OptionBuilder().setTransports(['websocket']).setQuery(
    //       {
    //         // SessionConstants.username : storage.read("access"),
    //         "meet_id" : ch_id,
    //         SessionConstants.sender : "A",
    //       }).build(),
    // );
    // connectSocket();

    print("typeeeee");
    print(sessionHistory.rate);
    print(type);
    print(action);
    if(type=="REQUESTED") {
      if(action=="ACCEPT") {
        rate = sessionHistory.rate;
        accept();
      }
      else if(action=="REJECTED") {
        reject();
      }
      else if(action=="NOT DECIDED"){
        print("ssweb: not decided");
        bool? go = await getSessionHistory();
        print("ssweb:gooo $go");

        if(go==true) {
          print(go);
          Get.back();
          Essential.showSnackBar(sessionHistory.reason??"Call has been ${sessionHistory.status}");
        }
        else {
          ch_id = sessionHistory.id;
          token = sessionHistory.token ?? "";
          meetingID = sessionHistory.meeting_id ?? "";
          sessionID = sessionHistory.session_id ?? "";
          rate = sessionHistory.rate;
          startRing(60);
        }
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
    if(type=="REQUESTED") {
      player.setAsset("assets/audio/notification.mp3");
      player.play();
      player.processingStateStream.listen((processingState) {
        if (processingState == ProcessingState.completed && type == "REQUESTED") {
          player.seek(Duration.zero);
          player.play();
          update();
          print("completed");
        }
      });
      update();
    }
    print("timerrrrrr");
    print(timer);
    if(timer==null) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setRing();
      });
    }
    update();
  }

  Future<void> setRing() async {
    print(ring);
    ring-=1;
    update();
    if(ring<=0) {
      stopTimer();
      File file = File("${directory.path}/calling.txt");
      print("ssweb: overrrrrr");
      String calling_status = await file.readAsString();
      print(calling_status);
      if(calling_status.isEmpty) {
        if (type == "REQUESTED") {
          print("ssweb: waitlist");
          waitlistCall();
        }
        else {
          print("ssweb: missed");
          missedCall();
        }
      }
    }
  }

  void startTimer(String from) {
    print("ssweb: startTimer $from");
    // var gmt = tz.getLocation('GMT');
    // tz.TZDateTime now = tz.TZDateTime.now(gmt);
    // Duration duration = now.difference(started_at);
    // print("ssweb: startedddddd");
    // print(now);
    // print(started_at);
    // print(duration);
    // seconds = duration.inSeconds;
    // update();
    print("start timerrrrr");

    try {
      var kolkata = tz.getLocation('GMT');
      Duration duration = tz.TZDateTime.now(kolkata).difference(started_at);
      seconds = duration.inSeconds;
      update();
      timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
      update();
      print("start timerrrrr overrrr");
    }
    catch(ex) {
      getSessionHistory();
    }
  }


  void setCountDown() {
    seconds+=1;
    update();
    print(max);
    print(seconds);
    if(max<=seconds) {
      print("ssweb: enddd");
      end(true);
    }
  }

  void stopTimer({bool? back}) {
    print("stopppppp $timer");
    print("stopppppp $back");
    if(player.playing) {
      player.stop();
      print(player.playing);
    }
    if(timer!=null) {
      print("stoppppppedddddd");
      timer?.cancel();
      update();
    }
    if(back==true) {
      this.back();
    }
  }

  Future<void> accept() async {
    print("ssweb: accept $type");
    stopTimer();
    screen = true;
    micEnabled = true;
    camEnabled = false;
    speakerEnabled = false;
    update();
    await initCameraPreview();
    print("ssweb: accepteddddd");
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
      if(globalNotifier.callController.value!=null) {
        globalNotifier.updateCallController(null);
      }

      await meetingProvider.cancel(data, storage.read("access")).then((response) async {
        if(response.code==1) {
          type = "CANCELLED";
          load = true;
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
      back();
    }
  }


  Future<void> endMeeting(String from, String status, {bool? back, String? path}) async {
    print("ssweb: endddd meeting from $from");
    try {
      print("ssweb: endddd $timer");
      print("ssweb: endddd ${globalNotifier.callingStatus}");
      print("ssweb: endddd backk $back");
      if (timer != null) {
        stopTimer();
      }
      action = "VIEW";
      type = status;
      load = true;
      update();
      print("ssweb: Recordingggggg : Stop endd meetingggg");
      try {
        // meeting?.stopRecording();
        meeting?.end();
      }
      catch(ex) {
        print("ssweb: meeting error $ex");
      }
      disposeObjects();

      if(back!=true) {
        try {
          Get.back();
        }
        catch(ex) {
          print("ssweb: error $ex");
          // getSessionHistory();
        }
        if(status!="ACTIVE") {
          Essential.showSnackBar(
              sessionHistory.reason ?? "Call has been $status"
          );
        }
      }
      else {
        print("ssweb: SystemChannels.platform.invokeMethod('SystemNavigator.pop')");
        print(SystemChannels.platform.invokeMethod('SystemNavigator.pop'));
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }


    }
    catch(ex) {
      print("ssweb: ex");
      print(ex);
    }
  }

  Future<void> initCameraPreview() async {
    // Get available cameras
    await availableCameras().then((availableCameras) async {
      // stores selected camera id

      print("availableCameras()");
      print(availableCameras);
      int selectedCameraId = availableCameras.length > 1 ? 1 : 0;

      print("availableCamerassss()");

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
      meeting?.muteMic();
      micEnabled = true;
    } else {
      meeting?.unmuteMic();
      micEnabled = false;
    }
    update();
  }

  void updateCamera() {
    // camEnabled = !camEnabled;
    // camEnabled = !camEnabled;
    print("videoStreammmmm");
    print(videoStream);
    print(meeting?.camEnabled);
    // if (videoStream != null) {
      if (meeting?.camEnabled==true) {
      meeting?.disableCam();
      camEnabled = false;
    } else {
        print("innnnn");
      meeting?.enableCam();
      camEnabled = true;
        print("out");
    }
    update();
  }


  void updateSpeaker() {
    List<MediaDeviceInfo> outputDevices = meeting!.getAudioOutputDevices();
    for (var element in outputDevices) {
      if(speakerEnabled) {
        if(element.deviceId!="speaker") {
          meeting?.switchAudioDevice(element);
          speakerEnabled = false;
          update();
          break;
        }
      }
      else {
        if(element.deviceId=="speaker") {
          meeting?.switchAudioDevice(element);
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
      print("ssweb: response.toJson()");
      print(response.toJson());
      if(response.code==1) {
        token = response.token??"";
        type = response.data?.status??type;
        load = true;
        update();

        print("ssweb: type res ${response.data?.status}");
        print("ssweb: type $type");
        if(type=="REQUESTED" || type=="ACTIVE" || type=="RECONNECT") {
          joinRoom();
        }
        else {
          endMeeting("validate meeting 534", type);
        }
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

  joinRoom() async {
    print("ssweb: joinnnnnn");
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      // Create instance of Room (Meeting)
      CustomTrack customTrack = await VideoSDK.createCameraVideoTrack(
          encoderConfig: CustomVideoTrackConfig.h240p_w320p,
          facingMode: "environment",
          multiStream: false // false,  Default : true
      );

      print("ssweb: meeting?.isBlank");
      print(meeting);
      if(meeting==null) {
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
          customCameraVideoTrack: customTrack,
          participantId: "A"
        );

        update();
        print("ssweb: register before");
        print(meeting);
        registerMeetingEvents();
        print("ssweb: register after");
        // Register meeting events

        // Join meeting
        print("ssweb: meeting before");
        meeting?.join();
        print("ssweb: meeting after");
        stopTimer();
        print("ssweb: time after");
        update();
        print(type);
        print("ssweb: type after");
      }
    } catch (error) {

      print("ssweb: error");
      print(error);

      //showSnackBarMessage(message: error.toString(), context: context);
      Essential.showSnackBar("Errorrrr: ${error.toString()}");
    }
  }


  void registerMeetingEvents() {
    meeting?.on(
      Events.roomJoined,
          () {
            print("ssweb: joinedddd Room");
        print("ssweb: room joineddddd $type $action");
          print(meeting?.participants.length);
        if((meeting?.participants??{}).isNotEmpty) {
          print("ssweb: local participant ${meeting?.localParticipant.id}");
          print("ssweb: participants ${meeting?.participants.keys}");
        }

        if((type=="RECONNECT" && (meeting?.participants.length??0)>1) || (type!="RECONNECT" && (meeting?.participants.length ?? 0) >= 0)) {
          if (joined == false) {
              stopTimer();
              joined = true;
              seconds = 0;
              type = "ACTIVE";
              load = true;
              calculateCountdown();
              update();
              startTimer("room joined");

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

              print("ssweb: Recordingggggg : Start Joined");
              // meeting?.startRecording(config: config);
            }
        }
        // else {
          // this.meeting = meeting;
          // update();
        // }
      },
    );

    meeting?.on(
      Events.participantJoined,
          (Participant participant) {
            print("ssweb: joinedddd Participant");
            print("ssweb: ssweb: participant joined $type $action");
            print(meeting?.participants.length);
            print("ssweb: participant ${participant.id}");
            print("ssweb: local participant ${meeting?.localParticipant.id}");
            print("ssweb: participants ${meeting?.participants.keys}");
            // if(meeting?.participants.length>2) {
            // if(participant.isLocal==false) {
            // if((type=="RECONNECT" && (meeting?.participants.length??0)>1) || (type!="RECONNECT" && (meeting?.participants.length ?? 0) >= 0)) {
            if(participant.id=="U") {
              if (joined == false) {
                  stopTimer();
                  joined = true;
                  seconds = 0;
                  type = "ACTIVE";
                  load = true;
                  calculateCountdown();
                  update();
                  startTimer("participant joined");
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
                  print("ssweb: Recordingggggg : Start Participant Joined");
                  // meeting?.startRecording(config: config);
                }
            }
      },
    );

    meeting?.on(
      Events.participantLeft,
          (Participant participant) {
        if(joined) {
          print("ssweb: Recordingggggg : Stop Participant Left");
          // meeting?.stopRecording();
          meeting?.end();
          back();
        }
      },
    );


    meeting?.on(
      Events.recordingStateChanged,
          (String status) {
            print("ssweb: Recordingggggg : State Changed - "+status);
      },
    );



    // Called when meeting is ended
    meeting?.on(Events.roomLeft, (String? errorMsg) {
      if (errorMsg != null) {
        Essential.showSnackBar("Meeting left due to $errorMsg !!");
      }

      // Get.back();
    });


    // Called when stream is enabled
    meeting?.localParticipant.on(Events.streamEnabled, (Stream _stream) {
      print("Streammmmm");
      print(_stream);
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
    meeting?.localParticipant.on(Events.streamDisabled, (Stream _stream) {
      if (_stream.kind == 'video' && videoStream?.id == _stream.id) {
        videoStream = null;
      } else if (_stream.kind == 'audio' && audioStream?.id == _stream.id) {
        audioStream = null;
      } else if (_stream.kind == 'share' && shareStream?.id == _stream.id) {
        shareStream = null;
      }
    });

    // Called when presenter is changed
    meeting?.on(Events.presenterChanged, (_activePresenterId) {
      Participant? activePresenterParticipant =
      meeting?.participants[_activePresenterId];

      // Get Share Stream
      Stream? _stream = activePresenterParticipant?.streams.values
          .singleWhere((e) => e.kind == "share");

      remoteParticipantShareStream = _stream;
      update();
    });

    meeting?.on(
        Events.participantLeft,
            (participant) => {
          if ((meeting?.participants.length??0) < 2)
            {
              joined = true,
              update(),
            }
        });


    meeting?.on(
        Events.error,
            (error)  {
          print("ssweb: errorrrr");
          print(error);
          Essential.showSnackBar("${error['name']} :: ${error['message']}");
        });
  }



  Future<bool> onWillPopScope() async {
    print("ssweb: leave");
    print("ssweb: leavee");
    if(joined) {
      meeting?.leave();
    }

    if(player.playing) {
      player.stop();
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
      SessionConstants.reason : "Call was rejected by astrologer",
    };

    if(globalNotifier.callController.value!=null) {
        globalNotifier.updateCallController(null);
      }

    await meetingProvider.reject(data, storage.read("access")).then((response) async {
      if(response.code==1) {
        type = "REJECTED";
        load = true;
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
    back();
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


  Future<bool?> getSessionHistory() async {
    Map <String, String> data = {
      SessionConstants.ch_id : ch_id.toString(),
      SessionConstants.sender : "A",
      SessionConstants.user_id : user.id.toString(),
    };


    return await meetingProvider.fetchByID(storage.read("access"), ApiConstants.id, data).then((response) async {
      // print(response.session_history?.toJson());
      print("ssweb: response ${response.session_history?.toJson()}");
      if(response.code==1) {

        user = response.user ?? user;
        sessionHistory = response.session_history ?? sessionHistory;
        wallet = response.wallet ?? 0;
        review = response.review;
        cnt = 0;

        if(sessionHistory.started_at!=null) {
          started_at = tz.TZDateTime.parse(location, "${sessionHistory.started_at ?? ""}+0000");
        }
        rate = sessionHistory.rate;
        chat_type = sessionHistory.type;
        token = sessionHistory.token??"";
        meetingID = sessionHistory.meeting_id??"";
        load = false;

        print(sessionHistory.status);
        if(sessionHistory.status=="REJECTED" || sessionHistory.status=="WAITLISTED" || sessionHistory.status=="CANCELLED") {
          // stopTimer();
          update();
          return true;
        }
        else if (type == "ACTIVE") {
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

          startTimer("history");
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

      return null;
    });
  }


  void calculateCountdown() {
    max = 0;
    print("ssweb: before max : $max");
    print("ssweb: wallet : $wallet");
    print("ssweb: rate : $rate");
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
    print("ssweb: after max : $max");
    update();
  }

  void end(bool auto) async {
    print("ssweb: endddd");
    if(timer!=null) {
      stopTimer();
    }


    Map<String, dynamic> data = {
      SessionConstants.sender: "A",
      SessionConstants.ch_id: ch_id.toString(),
      SessionConstants.reason : auto ? "Call was ended automatically due to low wallet balance" : "Astrologer ended the call",
      CommonConstants.seconds : seconds,
    };
    print("ssweb: "+data.toString());


    await meetingProvider.end(data, storage.read("access")).then((response) async {
      print("ssweb: ssweb: response.toJson()");
      print(response.toJson());
      if (response.code == 1) {
        print("ssweb: Recordingggggg : Stop End");

        try {
          // meeting?.stopRecording();
          meeting?.end();
        }
        catch(ex) {

        }
        disposeObjects();

        if(globalNotifier.callController.value!=null) {
          globalNotifier.updateCallController(null);
        }
        back();
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

    if(globalNotifier.callController.value!=null) {
        globalNotifier.updateCallController(null);
      }

    await meetingProvider.waitlist(data, storage.read("access")).then((response) async {
      print("ssweb: response.toJson()");
      print(response.toJson());
      if(timer!=null) {
        stopTimer();
      }

      if(response.code==1) {
        cnt = 0;
        type = response.data??"WAITLISTED";
        load = true;
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

  void missedCall() async {
    Map <String, dynamic> data = {
      SessionConstants.ch_id : ch_id,
      SessionConstants.sender : "A",
      SessionConstants.reason : "User missed the reconnect call.",
    };


    if(globalNotifier.callController.value!=null) {
        globalNotifier.updateCallController(null);
      }

    await meetingProvider.missed(data, storage.read("access")).then((response) async {
      if(timer!=null) {
        stopTimer();
      }

      if(response.code==1) {
        cnt = 0;
        type = "MISSED";
        load = true;
        update();
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

  void back() {
    if(timer!=null) {
      stopTimer();
    }

    if(player.playing) {
      player.stop();
    }

    disposeObjects();
    Get.back();
  }

  void disposeObjects() {
    print("disposeeee objectsss");
    timer = null;
    update();
    print(timer);

    shareStream = videoStream = audioStream = remoteParticipantShareStream = null;
    update();


    if(cameraController!=null) {
      try {
        cameraController?.stopImageStream();
        cameraController?.stopVideoRecording();
        cameraController?.dispose();
        print(cameraController);
        cameraController = null;
        update();
        print(cameraController);
        print("disposeeee objectsss overrrr");
      }
      catch(ex) {
        print(ex.toString());
      }
    }
    try {
      meeting?.stopLivestream();
      meeting?.stopHls();
    }
    catch(ex) {
      print(ex.toString());
    }
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

    await meetingProvider.manage(storage.read("access"), ApiConstants.rating+ApiConstants.reply, data).then((response) async {
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

  void goto(String page, {dynamic? arguments}) {
    Get.toNamed(page, arguments: arguments);
  }

  void updateValues() {
    print("sswebnotifier: before chat ${globalNotifier.showSession}");
    if(globalNotifier.showSession.value=="notification") {
      globalNotifier.updateValue("session");
    }
    globalNotifier.updateCallInit(false);
    print("sswebnotifier: after chat ${globalNotifier.showSession}");
  }

  void storeCalling(CallController callController) {
    globalNotifier.updateCallController(callController);
  }
}
