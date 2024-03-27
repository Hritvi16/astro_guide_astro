// import 'package:astro_guide_astro/call/CallController.dart';
// import 'package:astro_guide_astro/call/OneToOneMeetController.dart';
// import 'package:astro_guide_astro/callView/widgets/common/app_bar/meeting_appbar.dart';
// import 'package:astro_guide_astro/callView/widgets/common/joining/waiting_to_join.dart';
// import 'package:astro_guide_astro/callView/widgets/common/meeting_controls/meeting_action_bar.dart';
// import 'package:astro_guide_astro/callView/widgets/one-to-one/one_to_one_meeting_container.dart';
// import 'package:astro_guide_astro/colors/MyColors.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:videosdk/videosdk.dart';
//
//
// class OneToOneMeet extends StatelessWidget {
//   OneToOneMeet({ Key? key }) : super(key: key);
//
//   final OneToOneMeetController oneToOneMeetController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final statusBarHeight = MediaQuery.of(context).padding.top;
//     return GetBuilder<OneToOneMeetController>(
//       builder: (controller) {
//         return WillPopScope(
//           onWillPop: oneToOneMeetController.onWillPopScope,
//           child: oneToOneMeetController.joined
//               ? SafeArea(
//             child: Scaffold(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 body: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     if(oneToOneMeetController.meeting.participants.length>1)
//                       MeetingAppBar(
//                         meeting: oneToOneMeetController.meeting,
//                         token: oneToOneMeetController.token,
//                         recordingState: oneToOneMeetController.recordingState,
//                         isFullScreen: oneToOneMeetController.fullScreen,
//                       ),
//                     Expanded(
//                       child: GestureDetector(
//                           onDoubleTap: ()  {
//                             oneToOneMeetController.updateFullScreen();
//                           },
//                           child: OneToOneMeetingContainer(callController: CallController(), meeting: oneToOneMeetController.meeting, token: "", timer: Duration(seconds: 0))),
//                     ),
//                     AnimatedCrossFade(
//                       duration: const Duration(milliseconds: 300),
//                       crossFadeState: !oneToOneMeetController.fullScreen
//                           ? CrossFadeState.showFirst
//                           : CrossFadeState.showSecond,
//                       secondChild: const SizedBox.shrink(),
//                       firstChild: MeetingActionBar(
//                         meeting: oneToOneMeetController.meeting,
//                         isMicEnabled: oneToOneMeetController.audioStream != null,
//                         isCamEnabled: oneToOneMeetController.videoStream != null,
//                         isSpeakerEnabled: true,
//                         recordingState: oneToOneMeetController.recordingState,
//                         // Called when Call End button is pressed
//                         onKundliButtonPressed: () {
//                           oneToOneMeetController.meeting.end();
//                         },// Called when Call End button is pressed
//                         onCallEndButtonPressed: () {
//                           oneToOneMeetController.meeting.end();
//                         },
//
//                         onCallLeaveButtonPressed: () {
//                           oneToOneMeetController.meeting.leave();
//                         },
//                         // Called when mic button is pressed
//                         onMicButtonPressed: () {
//                           if (oneToOneMeetController.audioStream != null) {
//                             oneToOneMeetController.meeting.muteMic();
//                           } else {
//                             oneToOneMeetController.meeting.unmuteMic();
//                           }
//                         },
//                         // Called when camera button is pressed
//                         onCameraButtonPressed: () {
//                           if (oneToOneMeetController.videoStream != null) {
//                             oneToOneMeetController.meeting.disableCam();
//                           } else {
//                             oneToOneMeetController.meeting.enableCam();
//                           }
//                         },
//
//                         onSpeakerButtonPressed: () {},
//                       ),
//                     ),
//                   ],
//                 )),
//           )
//               : WaitingToJoin("", "", (){},"","", false, (){}, (){}),
//         );
//       },
//     );
//   }
//
// }
