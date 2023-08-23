import 'package:astro_guide_astro/controllers/myGallery/MyGalleryController.dart';
import 'package:astro_guide_astro/models/gallery/GalleryModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyGallery extends StatelessWidget {
  MyGallery({ Key? key }) : super(key: key);

  final MyGalleryController myGalleryController = Get.find();
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GetBuilder<MyGalleryController>(
      builder: (controller) {
        return myGalleryController.load ?
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
              height: standardUpperFixedDesignHeight,
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar("My Gallery".tr, options: GestureDetector(
                  onTap: () {
                    myGalleryController.addImages();
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
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: myGalleryController.galleries.isNotEmpty ? GridView.builder(
              itemCount: myGalleryController.galleries.length,
              padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 280
              ),
              itemBuilder: (context, index) {
                return getGalleryDesign(index, myGalleryController.galleries[index]);
              },
            )
            : Container(
              height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "You have no photos in your gallery!",
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
      ],
    );
  }

  Widget getGalleryDesign(int index, GalleryModel gallery) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: MyColors.colorPrimary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: MyColors.colorPrimary
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  ApiConstants.astrologerUrl+gallery.image,
                  height: 200,
                  width: MySize.size50(context),
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    myGalleryController.getApprovedStatus(gallery.approved),
                                    style: GoogleFonts.manrope(
                                        color: MyColors.labelColor(),
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/common/${myGalleryController.getApprovedIcon(gallery.approved)}.png",
                                    height: 20,
                                    color: myGalleryController.getApprovedColor(gallery.approved),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if(gallery.approved==1)
                          Switch(
                            value: gallery.status==1,
                            activeColor: gallery.load==true ? MyColors.colorOn.withOpacity(0.3) : MyColors.colorOn,
                            inactiveTrackColor: gallery.load==true ? MyColors.colorOff.withOpacity(0.3) : MyColors.colorOff,
                            onChanged: (value) {
                              myGalleryController.toggleStatus(index, value);
                            },
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 7, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            gallery.reason??"",
                            style: GoogleFonts.manrope(
                                color: MyColors.labelColor(),
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              myGalleryController.confirmDelete(index);
                            },
                            child: Image.asset(
                              "assets/common/delete.png",
                              height: 20,
                              color: MyColors.iconColor(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if(gallery.load==true)
          Container(
          height: 280,
          width: MySize.size100(context) - 20,
          decoration: BoxDecoration(
            color: MyColors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: MyColors.colorPrimary
            )
          ),
          child: LoadingAnimationWidget.dotsTriangle(
            color: MyColors.colorButton, size: 35
          ),
        )
      ],
    );
  }

}