import 'package:astro_guide_astro/chat_ui/CustomShape.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class ReceivedImageScreen extends StatelessWidget {
  final ChatModel chat;
  const ReceivedImageScreen({
    Key? key, required this.chat,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 15, bottom: 5),
      child: getMessageTextGroup(context),
    );
  }

  getMessageTextGroup(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              // color: Colors.grey[300],
              color: MyColors.receiverColor(),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    goto("/photoView", arguments: ApiConstants.chatUrl+chat.message);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      ApiConstants.chatUrl+chat.message,
                      height: MySize.size65(context),
                      width: MySize.size50(context),
                      fit: BoxFit.fill,
                      errorBuilder: (context, object, stackTrace) {
                        return GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            height: MySize.size65(context),
                            width: MySize.size50(context),
                            child: Icon(
                              Icons.broken_image_outlined,
                              size: 50,
                            ),
                          ),
                        );
                      },
                    )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    Essential.getDateTime(chat.sent_at),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 10,
                      color: MyColors.colorInfo,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getMessageTextGroup1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: CustomShape(Colors.grey[300]!),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: chat.message,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                // Text(
                //   chat.message,
                //   style: TextStyle(color: Colors.black, fontSize: 14),
                // ),
                SizedBox(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateFormat("dd MMM, yyyy  hh:mm a").format(DateTime.parse(chat.sent_at)),
                    style: TextStyle(
                        fontSize: 10
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
    });
  }
}
