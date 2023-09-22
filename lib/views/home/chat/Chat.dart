import 'package:astro_guide_astro/chat_ui/received_doc_screen.dart';
import 'package:astro_guide_astro/chat_ui/received_image_screen.dart';
import 'package:astro_guide_astro/chat_ui/received_message_screen.dart';
import 'package:astro_guide_astro/chat_ui/received_voice_screen.dart';
import 'package:astro_guide_astro/chat_ui/send_message_screen.dart';
import 'package:astro_guide_astro/chat_ui/send_voice_screen.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/constants/SessionConstants.dart';
import 'package:astro_guide_astro/controllers/chat/ChatController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/views/home/chat/Waiting.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Chat extends StatelessWidget {
  Chat({ Key? key }) : super(key: key);

  final ChatController chatController = Get.put<ChatController>(ChatController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ChatController>(
      builder: (controller) {
        return chatController.load ? chatController.type!="ACTIVE" && chatController.type!="COMPLETED" ?
        Waiting(chatController.user.name, chatController.user.profile??"", chatController.cancelChat, chatController.type, chatController.action, chatController.initiateChat, chatController.rejectChat, chatController.back)
            : Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.colorButton,
            iconTheme: IconThemeData(
                color: MyColors.black
            ),
            centerTitle: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      // radius: standardServiceOCRadius,
                      radius: 25,
                      // backgroundImage: AssetImage(
                      //   "assets/test/user.jpg"
                      // ),
                      backgroundImage: chatController.imageProvider,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatController.user.name,
                          style: TextStyle(
                              fontSize: 16,
                              color: MyColors.black
                          ),
                        ),

                        if(chatController.type=="ACTIVE")
                          Text(
                            chatController.getChatTime(),
                            style: GoogleFonts.manrope(
                                fontSize: 12,
                                color: MyColors.black
                            ),
                          ),
                      ],
                    ),

                  ],
                ),
                if(chatController.type=="ACTIVE")
                  GestureDetector(
                    onTap: () {
                      chatController.endChat(false);
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: MyColors.colorError,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: MyColors.colorError,
                        child: Image.asset(
                            "assets/call/end.png"
                        ),
                      ),
                    ),
                  ),
                if(chatController.type=="ENDED")
                  Icon(
                      Icons.share
                  )
              ],
            ),
          ),
          // bottomNavigationBar: getBottomPage(),
          // backgroundColor: MyColors.white,
          body: getBody(context),
        ) : LoadingScreen();
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/essential/bg.png")
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: chatController.chats.isNotEmpty ?
            ListView.separated(
              controller: chatController.controller,
              reverse: true,
              itemCount: chatController.chats.length,
              separatorBuilder: (buildContext, index) {
                return SizedBox(
                  height: 0,
                );
              },
              itemBuilder: (buildContext, index) {
                return getChatDesign(index, chatController.chats[index]);
              },
            )
                : SizedBox(
              height: 100,
            ),
          ),
          chatController.type=="ACTIVE" ? getBottomPage()
              : getBottom(context)
        ],
      ),
    );
  }

  Widget getChatDesign(int index, ChatModel chat) {
    print(chat);
    return chat.sender=="A" ?
    chat.m_type=="T" ? Column(
      children: [
        SentMessageScreen(chat: chat, color: MyColors.black,),
        if(chat.type=="A")
          SentMessageScreen(chat: chat.copyWith(message: SessionConstants.autoMessage), color: MyColors.red),
      ],
    ) : SentVoiceScreen(chat: chat, color: MyColors.black,)
        : chat.m_type=="T" ? ReceivedMessageScreen(chat: chat) : chat.m_type=="V" ? ReceivedVoiceScreen(chat: chat) : chat.m_type=="D" ? ReceivedDocScreen(chat: chat) : ReceivedImageScreen(chat: chat);
  }


  Widget getBottom(BuildContext context) {
    return Column(
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
              // if(chatController.sessionHistory.rating!=null)
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
          chatController.sessionHistory.rating!=null ? displayRating() : Text(
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
    return Container(
      width: MySize.size100(context),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.colorButton,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10),
        //   topRight: Radius.circular(10)
        // )
      ),
      child: SafeArea(
        child: Column(
          children: [
            Text(
              "Chat Duration: ${Essential.getChatDuration(chatController.action=="VIEW" ? null : chatController.seconds, chatController.sessionHistory.started_at??"", chatController.sessionHistory.ended_at??"", )}",
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


  getBottomPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                chatController.showQR ?
                GestureDetector(
                  onTap: () {
                    chatController.manageQR(false);
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.colorButton,
                    child: Icon(
                      Icons.quickreply_outlined,
                      color: MyColors.black,
                      size: 20,
                    ),
                  ),
                ) :
                GestureDetector(
                  onTap: () {
                    chatController.manageQR(true);
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.colorButton,
                    child: Icon(
                      Icons.quickreply,
                      color: MyColors.black,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  // child: getRecordView(),
                  child: chatController.recordTimer?.isActive==true ?
                  getRecordView() : getMessageBox(),
                ),
                SizedBox(
                  width: 10,
                ),
                chatController.send ?
                GestureDetector(
                  onTap: () {
                    chatController.sendText();
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.colorButton,
                    child: Icon(
                      Icons.send,
                      color: MyColors.black,
                      size: 20,
                    ),
                  ),
                ) :
                GestureDetector(
                  onLongPressStart: (details) {
                    chatController.startRecording();
                  },
                  onLongPressEnd: (details) {
                    chatController.stopRecording(true);
                  },
                  child: CircleAvatar(
                    backgroundColor: MyColors.colorButton,
                    child: Icon(
                      Icons.mic,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ],
            ),
            if(chatController.showQR)
              chatController.chats.isNotEmpty ?
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListView.separated(
                  controller: chatController.controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: chatController.replies.length,
                  separatorBuilder: (buildContext, index) {
                    return SizedBox(
                      height: 0,
                    );
                  },
                  itemBuilder: (buildContext, index) {
                    return getQRDesign(chatController.replies[index]);
                  },
                ),
              )
                  : Text(
                "No Quick Replies Found!",
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.labelColor()
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
              child: chatController.sessionHistory.anonymous==1 || (chatController.user.profile??"").isEmpty ?
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
                    ApiConstants.userUrl+(chatController.user.profile??"")
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
                          chatController.sessionHistory.anonymous==1 ? "Anonymous" : chatController.sessionHistory.user??"",
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
              chatController.review?.review??"",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.colorInfoGrey,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: 5,
            ),
            if ((chatController.review?.reply??"").isEmpty) GestureDetector(
                onTap: () {
                  chatController.manageReply();
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
                    Essential.getDateTime(chatController.review?.replied_at??""),
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
                  chatController.review?.reply??"",
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
                        chatController.manageReply();
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
                        chatController.confirmDelete();
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
      initialRating: chatController.review?.rating??0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: MyColors.colorUnrated,
      itemCount: 5,
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

  Widget getMessageBox() {
    return TextFormField(
      onChanged: (value) {
        chatController.changeSend();
      },
      keyboardType: TextInputType.name,
      style: GoogleFonts.manrope(
        fontSize: 16.0,
        color: MyColors.labelColor(),
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      controller: chatController.message,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.colorButton,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: "Type your message...",
        contentPadding: const EdgeInsets.symmetric(horizontal: 16,),
      ),
      validator: (value) {
        if ((value??"").isEmpty) {
          return "* Required";
        }  else {
          return null;
        }
      },
    );
  }

  Widget getRecordView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: chatController.recordDuration%2==0 ? MyColors.colorPSigns : MyColors.colorInactive,
          child: Icon(
            Icons.mic,
            color: chatController.recordDuration%2==0 ? MyColors.black : MyColors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          chatController.getTime(chatController.recordDuration),
          style: GoogleFonts.manrope(
              fontSize: 18,
              color: MyColors.black
          ),
        )
      ],
    );
  }

  Widget getQRDesign(QuickRepliesModel reply) {
    return GestureDetector(
      onTap: () {
        print(reply.reply);
        chatController.sendQuickReply(reply.reply);
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: MyColors.colorPrimary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: MyColors.colorPrimary
            )
        ),
        child: Text(
          reply.reply,
          style: GoogleFonts.manrope(
              color: MyColors.labelColor(),
              fontSize: 12,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

}
