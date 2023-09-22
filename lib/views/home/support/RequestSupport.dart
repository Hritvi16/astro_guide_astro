import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/support/RequestSupportController.dart';
import 'package:astro_guide_astro/controllers/support/RequestSupportController.dart';
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


class RequestSupport extends StatelessWidget {

  RequestSupport({ Key? key }) {
    requestSupportController.onInit();
  }

  final RequestSupportController requestSupportController = Get.put<RequestSupportController>(RequestSupportController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<RequestSupportController>(
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
                  child: CustomAppBar('Request Support'.tr),
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
      key: requestSupportController.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              standardTFLabel(text: 'Reason'.tr, optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: DropdownSearch<String>(
                    itemAsString: (String reason) => reason,
                    items: requestSupportController.reasons,
                    selectedItem: requestSupportController.reason,
                    dropdownDecoratorProps:  DropDownDecoratorProps(
                        baseStyle: GoogleFonts.manrope(
                          fontSize: 16.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                        ),
                        dropdownSearchDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.colorButton,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: "Select Reason".tr,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        )
                    ),
                    validator: (value) {
                      if (value==null) {
                        return "* Required";
                      }  else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      requestSupportController.changeReason(value);
                    },
                  )
              ),
              standardTFLabel(text: 'Message'.tr, optional: '*', optionalColor: MyColors.red, optionalFontSize: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: requestSupportController.message,
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
                    hintText: "Write your query".tr,
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
          requestSupportController.request();
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
              "Request".tr,
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
