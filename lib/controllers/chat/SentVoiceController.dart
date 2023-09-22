// import 'package:astro_guide_astro/chat_ui/common.dart';
// import 'package:astro_guide_astro/colors/MyColors.dart';
// import 'package:astro_guide_astro/models/chat/ChatModel.dart';
// import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/services.dart';
// import 'package:rxdart/rxdart.dart' as rx;
//
// class SentVoiceController extends GetxController {
//   SentVoiceController();
//
//   late Color color;
//   late ChatModel chat;
//   ChatModel? playing;
//
//   late AudioPlayer player;
//   Duration? duration;
//   late double value;
//
//   // Stream<PositionData> get positionDataStream =>
//   //     rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
//   //         player.positionStream,
//   //         player.bufferedPositionStream,
//   //         player.durationStream,
//   //             (position, bufferedPosition, duration) => PositionData(
//   //             position, bufferedPosition, duration ?? Duration.zero));
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   Future<void> start(ChatModel chat) async {
//     print("chatttttt");
//     print(chat);
//     value = 0;
//     player = AudioPlayer(playerId: chat.id.toString());
//     print(player.hashCode);
//     await player.setSourceUrl(ApiConstants.chatUrl+chat.message);
//
//     duration = await player.getDuration() ?? Duration();
//     update();
//
//     // player.durationStream.listen((duration) {
//     //   // Update UI with total audio duration
//     //   print('Total Duration: $duration');
//     // });
//
//     player.onDurationChanged.listen((duration) {
//       if((duration?.inSeconds??0)>value) {
//         value = (duration?.inSeconds??0).toDouble();
//         update();
//       }
//     });
//
//
//
//     player.onPlayerStateChanged.listen((processingState) {
//       print("processingStateeeee");
//       print(processingState);
//       if (processingState == PlayerState.completed) {
//         player.seek(Duration.zero);
//         value = 0;
//         player.pause();
//         playing = null;
//         update();
//         print("completed");
//       }
//     });
//   }
//
//   Color getColor() {
//     return chat.type=='A' ? MyColors.red :MyColors.black;
//   }
//
//   int getSeenStatus() {
//     if(chat.seen_at!=null) {
//       return 2;
//     }
//     else if(chat.received_at!=null) {
//       return 1;
//     }
//     else {
//       if(chat.id<0) {
//         return chat.error==1 ? -2 : -1;
//       }
//       return 0;
//     }
//   }
//
//   Future<void> play(ChatModel chat, Color color) async {
//     if(playing?.id!=chat.id) {
//       this.chat = chat;
//       playing = chat;
//       update();
//
//       print("chatttttt playyy");
//       print(chat);
//       print(ApiConstants.chatUrl + chat.message);
//       await player.setSourceUrl(ApiConstants.chatUrl+chat.message);
//
//       duration = await player.getDuration() ?? Duration();
//       update();
//
//       // player.durationStream.listen((duration) {
//       //   // Update UI with total audio duration
//       //   print('Total Duration: $duration');
//       // });
//
//       player.onDurationChanged.listen((duration) {
//         if((duration?.inSeconds??0)>value) {
//           value = (duration?.inSeconds??0).toDouble();
//           update();
//         }
//       });
//
//
//
//       player.onPlayerStateChanged.listen((processingState) {
//         print("processingStateeeee");
//         print(processingState);
//         if (processingState == PlayerState.completed) {
//           player.seek(Duration.zero);
//           value = 0;
//           player.pause();
//           playing = null;
//           update();
//           print("completed");
//         }
//       });
//     }
//     player.play(UrlSource(ApiConstants.chatUrl+chat.message));
//     update();
//     print("player.playing1");
//     // print(player.);
//     // print(player.processingState);
//   }
//
//   Future<void> pause() async {
//     await player.pause();
//     update();
//   }
//
//   bool getPlayerStatus(ChatModel chat) {
//     print("player.playing2");
//     // print(player.playing);
//     return player.state==PlayerState.playing && playing?.id==chat.id;
//   }
//
//   double getSeconds() {
//     print("duration.inSeconds.toDouble()");
//     print((duration?.inSeconds??0).toDouble());
//     return (duration?.inSeconds??0).toDouble();
//   }
//
//   double getValue(ChatModel chat) {
//     return getPlayerStatus(chat) ? value : 0;
//   }
// }