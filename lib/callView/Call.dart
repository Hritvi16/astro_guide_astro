import 'package:astro_guide_astro/call/CallController.dart';
import 'package:astro_guide_astro/callView/widgets/common/joining/waiting_to_join.dart';
import 'package:astro_guide_astro/callView/widgets/one-to-one/one_to_one_meeting_container.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/CommonConstants.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/services/StorageService.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Call extends StatelessWidget {
  Call({ Key? key }) : super(key: key);

  final CallController callController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // StorageService.storeCalling(callController);
    return GetBuilder<CallController>(
      builder: (controller) {
        return WillPopScope(
            onWillPop: callController.onWillPopScope,
            // child: callController.joined ?
            child: callController.load ? callController.type!="ACTIVE" && callController.type!="COMPLETED" ?
            WaitingToJoin(callController.user.name, callController.user.profile??"", callController.cancelMeeting, callController.type, callController.action, callController.accept,  callController.reject, callController.back) :
            Scaffold(
              body: callController.type=="COMPLETED" ? getCompletedDesign(context) : getActiveDesign(context),
              bottomNavigationBar: callController.type=="COMPLETED" ? getBottom(context) : null,
            ) : LoadingScreen()
          // : WaitingToJoin(callController.astrologer.name),
        );
      },
    );
  }

  Widget getCompletedDesign(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Call Detail'),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitleInfo("Customer Name", callController.user.name),
                SizedBox(
                  height: 5,
                ),
                getTitleInfo("Session Type", callController.sessionHistory.type, color: Essential.getSessionTypeColor(callController.sessionHistory.type)),
                SizedBox(
                  height: 5,
                ),
                getTitleInfo("Rate", "${CommonConstants.rupee}${callController.sessionHistory.rate}/min"),
                SizedBox(
                  height: 5,
                ),
                getTitleInfo("Status", callController.sessionHistory.status, color: Essential.getStatusColor(callController.sessionHistory.status)),
                SizedBox(
                  height: 10,
                ),
                getIconInfo("assets/common/info.png", callController.sessionHistory.reason??""),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    getIconInfo("assets/sign_up/calendar.png", Essential.getDate(Essential.getDTByStatus(callController.sessionHistory))),
                    SizedBox(
                      width: 10,
                    ),
                    getIconInfo("assets/sign_up/time.png", Essential.getTime(Essential.getDTByStatus(callController.sessionHistory))),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                getTitleInfo("Duration", Essential.getChatDuration(null, callController.sessionHistory.started_at??"", callController.sessionHistory.ended_at??"")),
                SizedBox(
                  height: 5,
                ),
                getTitleInfo("Amount", "${CommonConstants.rupee}${Essential.getEarningAmount(callController.sessionHistory)}"),
              ]
            ),
          )
        )
      ],
    );
  }

  Widget getActiveDesign(BuildContext context) {
    return SafeArea(
      child: Stack(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MySize.sizeh100(context),
            child: GestureDetector(
                onTap: ()  {
                  callController.updateFullScreen();
                },
                // child: callController.joined ?
                child: OneToOneMeetingContainer(callController: callController, meeting: callController.meeting!, token: callController.token, timer: Duration(seconds: callController.seconds),)
              // : WaitingToJoin(callController.user.name, callController.user.profile, callController.endMeeting, callController.type, callController.action, callController.accept,  callController.reject, callController.back)
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitleInfo(String title, String info, {Color? color}) {
    return RichText(
      text: TextSpan(
        text: title+": ",
        style:GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: MyColors.labelColor()
        ),
        children: [
          TextSpan(
            text: info,
            style:GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              color: color
            ),
          )
        ]
      ),
    );
  }


  Widget getIconInfo(String icon, String info, {Color? color, Color? textColor, double? textSize, bool flex = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          height: 15,
          width: 15,
          color: color??MyColors.colorButton,
        ),
        SizedBox(
          width: 3,
        ),
        flex ?
        Flexible(
          child: Text(
            info,
            style: GoogleFonts.manrope(
              fontSize: textSize??12.0,
              color: textColor??MyColors.colorGrey,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
            : Text(
          info,
          style: GoogleFonts.manrope(
            fontSize: textSize??12.0,
            color: textColor??MyColors.colorGrey,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget getBottom(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getReviewSection(context),
        getEndedBottom(context),
      ],
    );
  }

  getReviewSection(BuildContext context) {
    return Container(
      width: MySize.size100(context),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.colorLightPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Customer Feedback",
                    style: GoogleFonts.manrope(
                        fontSize: 18,
                        color: MyColors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              // if(callController.sessionHistory.rating!=null)
              //   InkWell(
              //     onTapDown: (TapDownDetails details) {
              //       showPopupMenu(context, details);
              //     },
              //     child: Container(
              //       padding: EdgeInsets.symmetric(horizontal: 5),
              //       child: Image.asset(
              //         "assets/common/more.png",
              //         height: 18,
              //         color: MyColors.colorInfoGrey,
              //       ),
              //     ),
              //   )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          callController.sessionHistory.rating!=null ? displayRating() : Text(
            "No review given",
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
                fontSize: 14,
                color: MyColors.colorInfoGrey,
                fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
  
  getEndedBottom(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MySize.size100(context),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: MyColors.colorButton,
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(10),
          //   topRight: Radius.circular(10)
          // )
        ),
        child: Column(
          children: [
            Text(
              "Chat Duration: ${Essential.getChatDuration(callController.action=="VIEW" ? null : callController.seconds, callController.sessionHistory.started_at??"", callController.sessionHistory.ended_at??"", )}",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.black,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Customer have been asked for genuine and honest review. In case of disagreement you can raise a dispute.",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: MyColors.white
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: MyColors.colorButton,
              child: callController.sessionHistory.anonymous==1 || (callController.user.profile??"").isEmpty ?
              CircleAvatar(
                radius: 15,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/sign_up/profile.png",
                    color: MyColors.black,
                  ),
                ),
              )
                  : CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    ApiConstants.userUrl+(callController.user.profile??"")
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 5),
                        child: Text(
                          callController.sessionHistory.anonymous==1 ? "Anonymous" : callController.sessionHistory.user??"",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: MyColors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      showRatings(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              callController.review?.review??"",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.colorInfoGrey,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 5,
            ),
            if ((callController.review?.reply??"").isEmpty) GestureDetector(
                onTap: () {
                  callController.manageReply();
                },
                child: getIconInfo("assets/common/reply.png", "Reply to this review", textColor: MyColors.colorButton, textSize: 14.0)
            ) else Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    Essential.getDateTime(callController.review?.replied_at??""),
                    style: GoogleFonts.manrope(
                      fontSize: 10.0,
                      color: MyColors.colorGrey,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  callController.review?.reply??"",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.manrope(
                    fontSize: 12.0,
                    color: MyColors.black,
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        callController.manageReply();
                      },
                      child: Text(
                        "Edit",
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: MyColors.colorButton,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        callController.confirmDelete();
                      },
                      child: Text(
                        "Delete",
                        style: GoogleFonts.manrope(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: MyColors.colorInactive,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget showRatings() {
    return RatingBar.builder(
      initialRating: callController.sessionHistory.rating??0,
      direction: Axis.horizontal,
      itemCount: 5,
      unratedColor: MyColors.colorUnrated,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      ignoreGestures: true,
      itemSize: 16,
      itemBuilder: (context, _) => Image.asset(
        "assets/common/star.png",
        color: MyColors.colorButton,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }
}
