import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/quickReply/QuickReplyController.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/Spacing.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class QuickReply extends StatelessWidget {

  QuickReply(List<QuickRepliesModel> replies, { Key? key }) {
    quickReplyController.replies = replies;
    quickReplyController.onInit();
  }

  final QuickReplyController quickReplyController = Get.put<QuickReplyController>(QuickReplyController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<QuickReplyController>(
      builder: (controller) {
        return getBody(context);
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      height: MySize.sizeh60(context),
      color: MyColors.cardColor(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              standardTFLabel(text: 'Quick Replies'),
              Padding(
                padding: EdgeInsets.only(top: standardVTBS, right: 10),
                child: GestureDetector(
                  onTap: () {
                    quickReplyController.back();
                  },
                  child: Icon(
                    Icons.close
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: quickReplyController.replies.isNotEmpty ? getListView() : Text(
              "No Quick Replies Found!",
              style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: MyColors.labelColor()
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget getListView() {
    return SingleChildScrollView(
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding, vertical: standardVerticalGap),
        itemCount: quickReplyController.replies.length,
        separatorBuilder: (buildContext, index) {
          return SizedBox(
            height: standardVerticalGap,
          );
        },
        itemBuilder: (buildContext, index) {
          return getDesign(quickReplyController.replies[index]);
        },
      ),
    );
  }

  Widget getDesign(QuickRepliesModel reply) {
    return InkWell(
      onTap: () {
        quickReplyController.sendQuickReply(reply);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
