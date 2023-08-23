import 'dart:io';

import 'package:astro_guide_astro/controllers/myGallery/ConfirmImagesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/size/MySize.dart';


class ConfirmImagesDialog extends StatelessWidget {
  final String text, btn1, btn2;

  ConfirmImagesDialog({Key? key, required this.text, required this.btn1, required this.btn2, required files}) {
    confirmImagesController.files = [];
    confirmImagesController.files.addAll(files);
    confirmImagesController.update();
  }

  final ConfirmImagesController confirmImagesController = Get.put<ConfirmImagesController>(ConfirmImagesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmImagesController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 15),
            child: Form(
              key: confirmImagesController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                        itemCount: confirmImagesController.files.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return getImageDesign(index, context);
                        }
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(text,
                      style: TextStyle(
                          fontSize: 16,
                          color: MyColors.black
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              confirmImagesController.back(result: false);
                            },
                            child: Text(btn1,
                              style: TextStyle(
                                  color: MyColors.colorPrimary
                              ),
                            )
                        ),
                        TextButton(
                            onPressed: () {
                              if(confirmImagesController.formKey.currentState!.validate()) {
                                confirmImagesController.uploadImages();
                              }
                            },
                            child: Text(btn2,
                              style: TextStyle(
                                  color: MyColors.colorPrimary
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getImageDesign(int index, BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Image.file(
          File(
            confirmImagesController.files[index]?.path??""
          ),
          height: 200,
          width: MySize.size100(context),
          fit: BoxFit.fill,
        ),
        GestureDetector(
          onTap: () {
            confirmImagesController.removeImage(index);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: MyColors.black.withOpacity(0.5),
                shape: BoxShape.circle
            ),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
