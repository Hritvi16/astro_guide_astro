import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/myQuickReplies/ManageQuickRepliesController.dart';
import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/shared/widgets/label/Label.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class ManageQuickReplies extends StatelessWidget {

  ManageQuickReplies({ Key? key , QuickRepliesModel? quickReply}) {
    manageQuickRepliesController.quickReply = quickReply;
    manageQuickRepliesController.onInit();
  }

  final ManageQuickRepliesController manageQuickRepliesController = Get.put<ManageQuickRepliesController>(ManageQuickRepliesController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<ManageQuickRepliesController>(
      builder: (controller) {
        return getBody(context);
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Container(
      height: MySize.sizeh50(context),
      color: MyColors.cardColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MySize.size100(context),
            height: standardBSUpperFixedDesignHeight,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: standardBSUpperFixedDesignHeight,
                decoration: BoxDecoration(
                    color: MyColors.colorPrimary,
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/essential/upper_bg.png"
                        )
                    )
                ),
                child: SafeArea(
                  child: CustomAppBar((manageQuickRepliesController.quickReply==null ? "Add" : "Update")+" Quick Reply")
                ),
              ),
            ),
          ),
          Flexible(
            child: getForm(),
          ),
          getActions(),
        ],
      ),
    );
  }
  
  Widget getForm() {
    return Form(
      key: manageQuickRepliesController.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              standardTFLabel(text: 'Reply', optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  controller: manageQuickRepliesController.reply,
                  maxLines: 6,
                  style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.colorButton,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Write your quick reply here...",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if ((value??"").isEmpty) {
                      return "* Required";
                    }  else {
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getActions() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: MyColors.borderColor()
          )
        )
      ),
      child: GestureDetector(
        onTap: () {
          manageQuickRepliesController.manage();
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              color: MyColors.colorPrimary,
              border: Border(
                  right: BorderSide(
                      color: MyColors.colorPrimary,
                      width: 0.5
                  )
              )
          ),
          child: Text(
              manageQuickRepliesController.quickReply==null ? "ADD" : "UPDATE",
              style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: MyColors.black
              )
          ),
        ),
      ),
    );
  }

}
