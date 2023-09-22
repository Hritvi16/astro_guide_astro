import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/setting/SettingController.dart';
import 'package:astro_guide_astro/controllers/theme/ThemesController.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/helpers/extensions/StringExtension.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class Setting extends StatelessWidget {
  Setting({ Key? key }) : super(key: key);

  final SettingController settingController = Get.put<SettingController>(
      SettingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Scaffold(
          body: getBody(context, theme),
        );
      },
    );
  }

  Widget getBody(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        // SizedBox(
        //   width: MySize.size100(context),
        //   height: 160,
        //   child: ClipPath(
        //     clipper: CustomClipPath(),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           color: MyColors.colorPrimary,
        //           image: const DecorationImage(
        //               image: AssetImage(
        //                   "assets/essential/upper_bg.png"
        //               )
        //           )
        //       ),
        //       child: SafeArea(
        //         child: CustomAppBar('Settings'.tr, options:
        //         GestureDetector(
        //           onTap: () {
        //             settingController.goto("/myProfile");
        //           },
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.only(top: 25.0),
        //                 child: Text(
        //                   settingController.astrologer.name,
        //                   style: GoogleFonts.playfairDisplay(
        //                     fontSize: 20.0,
        //                     color: MyColors.black,
        //                     letterSpacing: 0,
        //                     fontWeight: FontWeight.w700,
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 15,
        //               ),
        //               CircleAvatar(
        //                 radius: 40,
        //                 backgroundImage: NetworkImage(
        //                     ApiConstants.astrologerUrl+(settingController.astrologer.profile??"")
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ), arrow: false, crossAxisAlignment: CrossAxisAlignment.start),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: MySize.size100(context),
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: standardHorizontalPagePadding),
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: Padding(
                  // color: Colors.white,
                  padding: const EdgeInsets.only(top: 25.0, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings'.tr,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22.0,
                              color: MyColors.black,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              settingController.goto("/myProfile");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: Text(
                                      settingController.astrologer.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.playfairDisplay(
                                        fontSize: 18.0,
                                        color: MyColors.black,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        ApiConstants.astrologerUrl+(settingController.astrologer.profile??"")
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: CustomRefreshIndicator(
            onRefresh: settingController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  settingsTabWI('Update Rate'.tr, '', null, theme, onTab: () => settingController.updateRate()),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTabWI('Manage Gallery'.tr, '', null, theme, onTab: () => Get.toNamed("/myGallery", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTabWI('Manage Language'.tr, '', null, theme, onTab: () => Get.toNamed("/myLanguage", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTabWI('Manage Skills'.tr, '', null, theme, onTab: () => Get.toNamed("/mySkill", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTabWI('Manage Specifications'.tr, '', null, theme, onTab: () => Get.toNamed("/mySpec", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTabWI('Manage Bank Details'.tr, '', null, theme, onTab: () => Get.toNamed("/myBankDetails", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Wishlist'.tr, "assets/common/fav.png", '', null, theme, onTab: () => Get.toNamed("/wishlist", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Following'.tr, "assets/sign_up/profile.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/following", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Review'.tr, "assets/common/review.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/review", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Quick Replies'.tr, "assets/dashboard/chat.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/quickReplies", )),
                  SizedBox(
                    height: 16,
                  ),
                  settingsTab('Notification'.tr, "assets/common/notification.png", '', MyColors.colorButton, theme, onTab: () => Get.toNamed("/aboutUs", )),
                  SizedBox(
                    height: 16,
                  ),
                  GetBuilder<ThemesController>(builder: (_) {
                    return settingsTabI('Appearance'.tr, Get.isDarkMode ? Icons.dark_mode : Icons.light_mode, _.theme.toCapitalized(), MyColors.labelColor(), theme, onTab: () => showAppearanceModal(theme, _.theme));
                    // return Text(_.theme);
                  }),

                  const SizedBox(height: 16),
                  settingsTab('Change App Language'.tr, "assets/common/lang.png", (settingController.storage.read("language")??"").toUpperCase(), null, theme, onTab: () => settingController.goto("/language")),

                  const SizedBox(height: 16),
                  settingsTabWI('Terms and Condition'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.a_tc64, "title" : "Terms and Condition"})),

                  const SizedBox(height: 16),
                  settingsTabWI('Privacy Policy'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.a_privacy64, "title" : "Privacy Policy"})),

                  const SizedBox(height: 16),
                  settingsTabWI('About Us'.tr, "", null, theme, onTab: () => settingController.goto("/information", arguments: {"data" : settingController.setting.about_64, "title" : "About Us"})),

                  const SizedBox(height: 16),
                  settingsTabWI('Contact Us'.tr, "", null, theme, onTab: () => settingController.goto("/contactUs", arguments: settingController.setting)),

                  const SizedBox(height: 16),
                  settingsTabI('Logout'.tr, Icons.logout, "", null, theme, onTab: () => settingController.logout()),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget settingsTab(String title, String icon, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          // color: MyColors.white,
          borderRadius: BorderRadius.circular(10),
            boxShadow: Get.isDarkMode ? null
            : const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 25,
              color: color,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: GoogleFonts.manrope(
                  fontSize: 18.0,
                  color: MyColors.labelColor(),
                  // color: MyColors.black,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                  ),
                  children: [
                    if(trailing.isNotEmpty)
                      TextSpan(
                        text: " (${trailing})",
                        style: GoogleFonts.manrope(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTabWI(String title, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(10),
            boxShadow: Get.isDarkMode ? null
            : const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                color: MyColors.colorButton,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsTabI(String title, IconData icon, String trailing, Color? color, theme, {onTab}) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MyColors.cardColor(),
          borderRadius: BorderRadius.circular(10),
            boxShadow: Get.isDarkMode ? null
            : const [
              BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 1.0,
              )
            ]
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: color??MyColors.colorButton,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                color: MyColors.labelColor(),
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  showAppearanceModal(ThemeData theme, String current) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(16),
          height: 320,
          decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select a Theme", style: theme.textTheme.subtitle1,),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(Icons.brightness_5, color: Colors.blue,),
                title: Text("Light", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('light');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'light' ? Colors.blue : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_2, color: Colors.orange,),
                title: Text("Dark", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('dark');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'dark' ? Colors.orange : Colors.transparent,),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.brightness_6, color: Colors.blueGrey,),
                title: Text("System", style: theme.textTheme.bodyText1),
                onTap: () {
                  settingController.themesController.setTheme('system');
                  Get.back();
                },
                trailing: Icon(Icons.check, color: current == 'system' ? Colors.blueGrey : Colors.transparent,),
              ),
            ],
          ),
        )
    ).then((value) {
      settingController.update();
    });
  }
}