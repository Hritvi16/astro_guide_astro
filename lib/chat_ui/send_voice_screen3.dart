// import 'package:astro_guide_astro/chat_ui/CustomShape.dart';
// import 'package:astro_guide_astro/chat_ui/common.dart';
// import 'package:astro_guide_astro/colors/MyColors.dart';
// import 'package:astro_guide_astro/controllers/chat/SentVoiceController.dart';
// import 'package:astro_guide_astro/models/chat/ChatModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:astro_guide_astro/chat_ui/common.dart';
//
// class SentVoiceScreen extends StatelessWidget {
//   final Color color;
//   final ChatModel chat;
//   // final SentVoiceController sentVoiceController = Get.put<SentVoiceController>(SentVoiceController());
//
//   SentVoiceScreen({
//     Key? key, required this.chat, required this.color,
//   }) {
//     sentVoiceController.color = color;
//     sentVoiceController.chat = chat;
//     sentVoiceController.update();
//     sentVoiceController.start(chat);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<SentVoiceController> (
//       builder: (controller) {
//         return Padding(
//           padding: EdgeInsets.only(right: 10.0, left: 50, top: 15, bottom: 5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               SizedBox(height: 30),
//               getMessageTextGroup(context),
//
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget getMessageTextGroup(BuildContext context) {
//     return Flexible(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Flexible(
//               child: Container(
//                 padding: EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: MyColors.colorLightPrimary,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(18),
//                     bottomLeft: Radius.circular(18),
//                     bottomRight: Radius.circular(18),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     sentVoiceController.getSeenStatus()<0 ?
//                     Icon(
//                         Icons.upload
//                     )
//                         : sentVoiceController.getPlayerStatus(chat) ?
//                     GestureDetector(
//                       onTap: () async {
//                         sentVoiceController.pause();
//                       },
//                       child: Icon(
//                           Icons.pause
//                       ),
//                     )
//                         : GestureDetector(
//                       onTap: () async {
//                         sentVoiceController.play(chat, color);
//                       },
//                       child: Icon(
//                           Icons.play_arrow
//                       ),
//                     ),
//                     Text(sentVoiceController.player.hashCode.toString()),
//                     // StreamBuilder<PositionData>(
//                     //   stream: sentVoiceController.positionDataStream,
//                     //   builder: (context, snapshot) {
//                     //     final positionData = snapshot.data;
//                     //     return SeekBar(
//                     //       duration: positionData?.duration ?? Duration.zero,
//                     //       position: positionData?.position ?? Duration.zero,
//                     //       bufferedPosition:
//                     //       positionData?.bufferedPosition ?? Duration.zero,
//                     //       onChangeEnd: sentVoiceController.player.seek,
//                     //     );
//                     //   },
//                     // ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           DateFormat("dd MMM, yyyy  hh:mm a").format(DateTime.parse(chat.sent_at)),
//                           style: TextStyle(
//                               fontSize: 10
//                           ),
//                         ),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Icon(
//                           sentVoiceController.getSeenStatus()==-2 ? Icons.error_outline : sentVoiceController.getSeenStatus()==-1 ? Icons.timelapse : sentVoiceController.getSeenStatus()==0 ? Icons.done : Icons.done_all,
//                           color: sentVoiceController.getSeenStatus()==-2 ? MyColors.colorError : sentVoiceController.getSeenStatus()==2 ? MyColors.colorChat : MyColors.colorGrey,
//                           size: 14,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             CustomPaint(painter: CustomShape(MyColors.colorLightPrimary)),
//           ],
//         ));
//   }
//
// }
