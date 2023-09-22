import 'package:astro_guide_astro/chat_ui/CustomShape.dart';
import 'package:astro_guide_astro/chat_ui/common.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rx;

class SentVoiceScreen extends StatefulWidget {
  final Color color;
  final ChatModel chat;
  const SentVoiceScreen({
    Key? key, required this.chat, required this.color,
  }) : super(key: key);

  @override
  State<SentVoiceScreen> createState() => _SentVoiceScreenState();
}

class _SentVoiceScreenState extends State<SentVoiceScreen> {

  late Color color;
  late ChatModel chat;

  final player = AudioPlayer();
  late Duration duration;

  Stream<PositionData> get positionDataStream =>
      rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));


  @override
  void initState() {
    super.initState();
    color = widget.color;
    chat = widget.chat;
    start();
  }

  Future<void> start() async {
    duration = await player.setUrl(ApiConstants.chatUrl+chat.message) ?? Duration();

    player.durationStream.listen((duration) {
      // Update UI with total audio duration
      print('Total Duration: $duration');
    });

    player.processingStateStream.listen((processingState) {
      if (processingState == ProcessingState.completed) {
        player.seek(Duration.zero);
        player.pause();
        setState(() {

        });
        print("completed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, left: 50, top: 15, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          getMessageTextGroup(context),
        ],
      ),
    );
  }

  getMessageTextGroup(BuildContext context) {
    return Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: MyColors.colorLightPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    getSeenStatus()<0 ?
                    Icon(
                        Icons.upload
                    )
                    : player.playing ?
                    GestureDetector(
                      onTap: () async {
                        player.pause();
                        setState(() {

                        });
                      },
                      child: Icon(
                        Icons.pause
                      ),
                    )
                    : GestureDetector(
                      onTap: () async {
                        play();
                      },
                      child: Icon(
                        Icons.play_arrow
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  StreamBuilder<PositionData>(
                      stream: positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return SeekBar(
                          duration: positionData?.duration ?? Duration.zero,
                          position: positionData?.position ?? Duration.zero,
                          bufferedPosition:
                          positionData?.bufferedPosition ?? Duration.zero,
                          onChangeEnd: player.seek,
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          Essential.getDateTime(chat.sent_at),
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          getSeenStatus()==-2 ? Icons.error_outline : getSeenStatus()==-1 ? Icons.timelapse : getSeenStatus()==0 ? Icons.done : Icons.done_all,
                          color: getSeenStatus()==-2 ? MyColors.colorError : getSeenStatus()==2 ? MyColors.colorChat : MyColors.colorGrey,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomPaint(painter: CustomShape(MyColors.colorLightPrimary)),
          ],
        ));
  }

  Color getColor() {
    return chat.type=='A' ? MyColors.red :MyColors.black;
  }

  int getSeenStatus() {
    if(chat.seen_at!=null) {
      return 2;
    }
    else if(chat.received_at!=null) {
      return 1;
    }
    else {
      if(chat.id<0) {
        return chat.error==1 ? -2 : -1;
      }
      return 0;
    }
  }

  Future<void> play() async {

    duration = await player.setUrl(ApiConstants.chatUrl+chat.message) ?? Duration();
    setState(() {

    });

    player.durationStream.listen((duration) {
      // Update UI with total audio duration
      print('Total Duration: $duration');
    });
    player.play();
    setState(() {

    });
  }
}

