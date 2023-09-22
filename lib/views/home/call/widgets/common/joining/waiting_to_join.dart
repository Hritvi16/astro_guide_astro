import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaitingToJoin extends StatelessWidget {
  final String type, action;
  final String name, image;
  final dynamic cancel, accept, reject, back;
  const WaitingToJoin(this.name, this.image, this.cancel,  this.type,   this.action, this.accept, this.reject, this.back, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Container(
        width: MySize.size100(context),
        padding: EdgeInsets.only(top: MySize.sizeh15(context), bottom: MySize.sizeh5(context)),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/essential/bg.png"
                )
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      ApiConstants.userUrl+image
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(name,
                  style: GoogleFonts.manrope(
                      fontSize: 18.0,
                      color: MyColors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),
            type=="REQUESTED" ?
            action=="NOT DECIDED" ? getRequestIncoming() : getMessage(action=="ACCEPT" ? "Connecting" : action) : type=="MISSED"  || type=="REJECTED" ? displayMessage(type=="MISSED" ? "$name missed your call request." : "$name rejected your call request") : getMessage("Reconnecting")

            // screen ? Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Column(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             print("hdh");
            //             accept();
            //           },
            //           child: CircleAvatar(
            //             radius: 30,
            //             backgroundColor: MyColors.colorSuccess,
            //             child: Image.asset(
            //               "assets/call/accept.png",
            //               height: 26,
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text("Accept",
            //           style: GoogleFonts.manrope(
            //             fontSize: 18.0,
            //             color: MyColors.colorSuccess,
            //             fontWeight: FontWeight.w500
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             print("hdh");
            //             reject();
            //           },
            //           child: CircleAvatar(
            //             radius: 30,
            //             backgroundColor: MyColors.colorError,
            //             child: CircleAvatar(
            //               radius: 20,
            //               backgroundColor: MyColors.colorError,
            //               child: Image.asset(
            //                   "assets/call/end.png",
            //                 height: 35,
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Text("Reject",
            //           style: GoogleFonts.manrope(
            //             fontSize: 18.0,
            //             color: MyColors.colorError,
            //             fontWeight: FontWeight.w500
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // )
            // : Column(
            //   children: [
            //     Text("Connecting...",
            //       style: GoogleFonts.manrope(
            //         fontSize: 18.0,
            //         color: MyColors.black,
            //       ),
            //     ),
            //     SizedBox(
            //       height: 30,
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         print("hdh");
            //         function();
            //       },
            //       child: CircleAvatar(
            //         radius: 30,
            //         backgroundColor: MyColors.colorError,
            //         child: CircleAvatar(
            //           radius: 20,
            //           backgroundColor: MyColors.colorError,
            //           child: Image.asset(
            //               "assets/call/end.png"
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget getMessage(String message) {
    return Column(
      children: [
        Text("${message}...",
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.black,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            print("hdh");
            cancel();
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.colorError,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: MyColors.colorError,
              child: Image.asset(
                  "assets/call/end.png"
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget displayMessage(String message) {
    return Column(
      children: [
        Text(message,
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.black,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
                color: MyColors.colorButton,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text(
              "OK",
              style: GoogleFonts.manrope(
                fontSize: 16.0,
                color: MyColors.white,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getRequestIncoming() {
    return Column(
      children: [
        Text("Incoming call",
          style: GoogleFonts.manrope(
            fontSize: 18.0,
            color: MyColors.black,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                print("hdh");
                accept();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: MyColors.colorSuccess,
                child: Image.asset(
                  "assets/call/accept.png",
                  height: 26,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("hdh");
                reject();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: MyColors.colorError,
                child: Image.asset(
                  "assets/call/end.png",
                  height: 35,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
