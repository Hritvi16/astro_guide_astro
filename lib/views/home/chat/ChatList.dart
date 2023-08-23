// import 'package:astro_guide_astro/colors/MyColors.dart';
// import 'package:astro_guide_astro/constants/CommonConstants.dart';
// import 'package:astro_guide_astro/controllers/chat/ChatListController.dart';
// import 'package:astro_guide_astro/essential/Essential.dart';
// import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
// import 'package:astro_guide_astro/models/chat/ChatModel.dart';
// import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
// import 'package:astro_guide_astro/shared/CustomClipPath.dart';
// import 'package:astro_guide_astro/shared/widgets/button/Button.dart';
// import 'package:astro_guide_astro/size/MySize.dart';
// import 'package:astro_guide_astro/size/Spacing.dart';
// import 'package:astro_guide_astro/size/WidgetSize.dart';
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:math' as math;
//
// import 'package:intl/intl.dart';
//
//
// class ChatList extends StatelessWidget  {
//   ChatList({ Key? key }) : super(key: key);
//
//   final ChatListController chatListController = Get.put<ChatListController>(ChatListController());
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GetBuilder<ChatListController>(
//       builder: (controller) {
//         return Scaffold(
//           backgroundColor: MyColors.white,
//           body: getBody(context),
//         );
//       },
//     );
//   }
//
//   Widget getBody(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: MySize.size100(context),
//           height: standardUpperFixedDesignHeight,
//           child: ClipPath(
//             clipper: CustomClipPath(),
//             child: Container(
//               height: standardUpperFixedDesignHeightWithSearch,
//               padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
//               decoration: BoxDecoration(
//                   color: MyColors.colorPrimary,
//                   image: const DecorationImage(
//                       image: AssetImage(
//                           "assets/essential/upper_bg.png"
//                       )
//                   )
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   // color: Colors.white,
//                   padding: const EdgeInsets.only(top: 25.0, bottom: 40),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Chats',
//                             style: GoogleFonts.playfairDisplay(
//                               fontSize: 22.0,
//                               color: MyColors.black,
//                               letterSpacing: 0,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   chatListController.goto("/wallet");
//                                 },
//                                 child: Image.asset(
//                                   "assets/common/wallet.png",
//                                   height: 25,
//                                   color: MyColors.black,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   chatListController.logout();
//                                 },
//                                 child: Image.asset(
//                                   "assets/common/lang.png",
//                                   height: 25,
//                                   color: MyColors.black,
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Flexible(
//           flex: 1,
//           child: CustomRefreshIndicator(
//             onRefresh: chatListController.onRefresh,
//             builder: MaterialIndicatorDelegate(
//               builder: (context, controller) {
//                 return Image.asset(
//                   "assets/essential/loading.png",
//                   height: 30,
//                 );
//               },
//             ),
//             child: SingleChildScrollView(
//               physics: AlwaysScrollableScrollPhysics(),
//               child: getChatHistory(context),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//
//   Widget getChatHistory(BuildContext context) {
//     return chatListController.chats.isNotEmpty
//     ? ListView.separated(
//       itemCount: chatListController.chats.length,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       separatorBuilder: (buildContext, index) {
//         return SizedBox(
//           height: 10,
//         );
//       },
//       itemBuilder: (buildContext, index) {
//         return getChatDesign(index, context);
//       }
//     )
//     : getNoDataWidget("You’ve not taken any chat\nconsultations yet!");
//   }
//
//   Widget getChatDesign(int index, BuildContext context) {
//     ChatHistoryModel chat = chatListController.chats[index];
//     return GestureDetector(
//       onTap: () {
//         chatListController.goto("/chat", arguments: chat);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             color: MyColors.grey.withOpacity(0.1),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               backgroundColor: MyColors.grey,
//               radius: 30,
//               child: chat.profile.isNotEmpty ?
//               CircleAvatar(
//                 radius: 28,
//                 backgroundImage:
//                 NetworkImage(
//                   ApiConstants.userUrl+chat.profile,
//                 )
//               )
//               : CircleAvatar(
//                 radius: 28,
//                 backgroundImage:
//                 AssetImage(
//                   "assets/test/user.jpg",
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Flexible(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     chat.user,
//                     maxLines: 1,
//                     overflow: TextOverflow.visible,
//                     style: TextStyle(
//                         fontSize: 18,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Text(
//                     chat.message,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: MyColors.black,
//                         fontWeight: FontWeight.w500
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         chat.status,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: MyColors.red,
//                           fontWeight: FontWeight.w600
//                         ),
//                       ),
//                       Text(
//                         chatListController.getDisplayDateTime(chat.status=="ACTIVE" || chat.status=="ENDED" ? chat.sent_at : chat.requested_at),
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: MyColors.black,
//                           fontWeight: FontWeight.w400
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget getPLDesign(int index, BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//           color: MyColors.white,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//               color: MyColors.borderColor()
//           )
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                 child: Text(
//                   "Recharge",
//                   style: GoogleFonts.manrope(
//                     fontSize: 14.0,
//                     color: MyColors.black,
//                     letterSpacing: 0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Text(
//                 "${index%3==0 ? '+' : '-'}INR ${math.Random().nextInt(1000).toDouble()}",
//                 style: GoogleFonts.manrope(
//                   fontSize: 14.0,
//                   color: index%3==0 ? MyColors.colorSuccess : MyColors.colorError,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               getIconInfo("assets/sign_up/calendar.png", DateFormat("dd MMM, yy").format(DateTime.now())),
//               SizedBox(
//                 width: 10,
//               ),
//               getIconInfo("assets/sign_up/time.png", DateFormat("hh:MM aa").format(DateTime.now())),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "#AT_HGGGF1542gRR72",
//                 style: GoogleFonts.manrope(
//                   fontSize: 14.0,
//                   color: MyColors.colorGrey,
//                   letterSpacing: 0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   await Clipboard.setData(ClipboardData(text: "#AT_HGGGF1542gRR72"));
//                 },
//                 child: getIconInfo("assets/common/copy.png", "Copy", color: MyColors.colorGrey)
//               ),
//             ],
//           ),
//           GestureDetector(
//             onTap: () {
//             },
//             child: standardButton(
//               context: context,
//               height: 40,
//               backgroundColor: index%3==0 ? MyColors.colorSuccess : MyColors.colorError,
//               margin: EdgeInsets.only(top: 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "assets/common/${index%3==0 ? 'success' : 'error'}.png",
//                     height: 18,
//                     width: 18,
//                   ),
//                   SizedBox(
//                     width: 11,
//                   ),
//                   Text(
//                     index%3==0 ? "Success" : "Failed",
//                     style: GoogleFonts.manrope(
//                       fontSize: 16.0,
//                       color: MyColors.white,
//                       letterSpacing: 0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget getIconInfo(String icon, String info, {Color? color}) {
//     return Row(
//       children: [
//         Image.asset(
//           icon,
//           height: 15,
//           width: 15,
//           color: color??MyColors.colorButton,
//         ),
//         SizedBox(
//           width: 3,
//         ),
//         Text(
//           info,
//           style: GoogleFonts.manrope(
//             fontSize: 12.0,
//             color: MyColors.colorGrey,
//             letterSpacing: 0,
//             fontWeight: FontWeight.w600,
//           ),
//         )
//       ],
//     );
//   }
//
//   getNoDataWidget(String message) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             "assets/common/no_data.png",
//             height: 240,
//             width: 240,
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           Text(
//             "Uh-Oh!",
//             style: GoogleFonts.manrope(
//               fontSize: 22.0,
//               color: MyColors.black,
//               letterSpacing: 0,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: 4,
//           ),
//           Text(
//             message,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.manrope(
//               fontSize: 14.0,
//               color: MyColors.colorGrey,
//               letterSpacing: 0,
//               fontWeight: FontWeight.w500,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
// }
