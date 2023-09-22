import 'package:astro_guide_astro/controllers/myQuickReplies/MyQuickRepliesController.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyQuickReplies extends StatelessWidget {
  MyQuickReplies({ Key? key }) : super(key: key);

  final MyQuickRepliesController myQuickRepliesController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyQuickRepliesController>(
      builder: (controller) {
        return myQuickRepliesController.load ?
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: getBody(),
        )
        : LoadingScreen();
      },
    );
  }

  Widget getBody() {
    return Column(
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
                child: CustomAppBar("My Quick Replies".tr, options: GestureDetector(
                  onTap: () {
                    myQuickRepliesController.manage(null);
                  },
                  child: Image.asset(
                    "assets/common/add.png",
                    height: 25,
                  ),
                ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: myQuickRepliesController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: myQuickRepliesController.replies.isNotEmpty ? Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ListView.separated(
                  itemCount: myQuickRepliesController.replies.length,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return getQuickReplyDesign(index, myQuickRepliesController.replies[index]);
                  },
                ),
              )
              : Container(
                height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "You have no quick replies stored!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getQuickReplyDesign(int index, QuickRepliesModel reply) {
    return Container(
      width: MySize.size100(context),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: MyColors.colorPrimary.withOpacity(index%2==0 ? 0.1 : 0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: MyColors.colorPrimary
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  reply.reply,
                  style: GoogleFonts.manrope(
                      color: MyColors.labelColor(),
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),

              if(reply.load==true)
                LoadingAnimationWidget.dotsTriangle(
                    color: MyColors.colorButton, size: 35
                )
            ],
          ),
          Divider(
            color: MyColors.colorPrimary,
            thickness: 2,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Switch(
                  value: reply.status==1,
                  activeColor: reply.load==true ? MyColors.colorOn.withOpacity(0.3) : MyColors.colorOn,
                  inactiveTrackColor: reply.load==true ? MyColors.colorOff.withOpacity(0.3) : MyColors.colorOff,
                  onChanged: (value) {
                    myQuickRepliesController.toggleStatus(index, value);
                  },
                ),
              ),
              Container(
                height: 40,
                width: 2,
                color: MyColors.colorPrimary,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: () {
                    myQuickRepliesController.manage(myQuickRepliesController.replies[index]);
                  },
                  child: Icon(
                    Icons.edit,
                    color: MyColors.iconColor(),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 2,
                color: MyColors.colorPrimary,
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: GestureDetector(
                  onTap: () {
                    myQuickRepliesController.confirmDelete(index);
                  },
                  child: Image.asset(
                    "assets/common/delete.png",
                    height: 20,
                    color: MyColors.iconColor(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}