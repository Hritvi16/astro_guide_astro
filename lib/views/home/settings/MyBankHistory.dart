import 'package:astro_guide_astro/controllers/myBank/MyBankHistoryController.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/bank/BankModel.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyBankHistory extends StatelessWidget {
  MyBankHistory({ Key? key }) : super(key: key);

  final MyBankHistoryController myBankHistoryController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyBankHistoryController>(
      builder: (controller) {
        return myBankHistoryController.load ?
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
                child: CustomAppBar("My Bank History".tr, options: GestureDetector(
                  onTap: () {
                    myBankHistoryController.goto("/manageBankDetails");
                  },
                  child: Image.asset(
                    "assets/common/add.png",
                    height: 25,
                    color: MyColors.black,
                  ),
                ),),
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: myBankHistoryController.history.isNotEmpty ?
            ListView.separated(
              itemCount: myBankHistoryController.history.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 0,
                );
              },
              itemBuilder: (context, index) {
                return getHistoryDesign(index, myBankHistoryController.history[index]);
              },
            )
            : Essential.getNoDataWidget("No Bank Details Found!"),
          ),
        ),
      ],
    );
  }

  Widget getHistoryDesign(int index, BankModel bank) {
    return SwipeActionCell(
      key: ValueKey(bank.id),
      trailingActions: [
        SwipeAction(
          icon: Icon(
            Icons.delete,
            color: MyColors.inverseIconColor(),
          ),
          color: MyColors.colorOff,
          performsFirstActionWithFullSwipe: true,
          nestedAction: SwipeNestedAction(title: "Confirm"),
          onTap: (handler) async {
            if(await myBankHistoryController.deleteBankHistory(bank.id)) {
              await handler(true);
              myBankHistoryController.removeHistory(bank);
            }
          }),
        SwipeAction(
          icon: Icon(
            Icons.edit,
            color: MyColors.inverseIconColor(),
          ),
          color: Colors.grey,
          onTap: (handler) async {
            if(await myBankHistoryController.goto("/manageBankDetails", arguments: bank)) {
              await handler(false);
            }
          }
        ),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
            color: MyColors.cardColor(),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
                color: MyColors.borderColor()
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                Essential.getDateTime(bank.created_at),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text: bank.bank_name,
                      style: GoogleFonts.manrope(
                        fontSize: 14.0,
                        color: MyColors.labelColor(),
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "  [${bank.branch}]",
                          style: GoogleFonts.manrope(
                            fontSize: 14.0,
                            color: MyColors.labelColor(),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ]
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  bank.verified==1 ? bank.status==1 ? "Verified" : "Inactive" : "Unverified",
                  style: GoogleFonts.manrope(
                    fontSize: 14.0,
                    color: bank.verified==1 && bank.status==1 ? MyColors.colorSuccess : MyColors.colorError,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            getTitleInfo("Holder", bank.holder_name),
            SizedBox(
              height: 5,
            ),
            getTitleInfo("Acc No.", bank.account_no),
            SizedBox(
              height: 5,
            ),
            getTitleInfo("IFSC", bank.ifsc),
          ],
        ),
      ),
    );
  }

  Widget getTitleInfo(String title, String info) {
    return RichText(
      text: TextSpan(
          text: title+' :  ',
          style: GoogleFonts.manrope(
            fontSize: 14.0,
            color: MyColors.labelColor(),
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: info,
              style: GoogleFonts.manrope(
                fontSize: 14.0,
                color: MyColors.labelColor(),
                letterSpacing: 0,
                fontWeight: FontWeight.w700,
              ),
            )
          ]
      ),
    );
  }

}