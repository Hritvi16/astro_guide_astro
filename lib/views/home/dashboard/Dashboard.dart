import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/controllers/dashboard/DashboardController.dart';
import 'package:astro_guide_astro/models/chartData/ChartData.dart';
import 'package:astro_guide_astro/models/report/BasicReportModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/CustomClipPath.dart';
import 'package:astro_guide_astro/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide_astro/size/MySize.dart';
import 'package:astro_guide_astro/size/WidgetSize.dart';
import 'package:astro_guide_astro/views/loadingScreen/LoadingScreen.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Dashboard extends StatelessWidget {
  Dashboard({ Key? key }) : super(key: key);

  // final DashboardController dashboardController = Get.find();
  final DashboardController dashboardController = Get.put<DashboardController>(
      DashboardController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          // backgroundColor: MyColors.colorBG,
          body: dashboardController.load ? getBody(context) : LoadingScreen(),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
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
                child: CustomAppBar('Dashboard'.tr, options: Row(
                  children: [
                    Image.asset(
                      "assets/common/notification.png",
                      height: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        dashboardController.goto("/wallet");
                      },
                      child: Image.asset(
                        "assets/common/wallet.png",
                        height: 25,
                        color: MyColors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        dashboardController.goto("/language");
                      },
                      child: Image.asset(
                        "assets/common/lang.png",
                        height: 25,
                        color: MyColors.black,
                      ),
                    )
                  ],
                ), arrow: false),
              ),
            ),
          ),
        ),
        // SizedBox(
        //   width: MySize.size100(context),
        //   child: ClipPath(
        //     clipper: CustomClipPath(),
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding),
        //       decoration: BoxDecoration(
        //           color: MyColors.colorPrimary,
        //           image: const DecorationImage(
        //               image: AssetImage(
        //                   "assets/essential/upper_bg.png"
        //               )
        //           )
        //       ),
        //       child: SafeArea(
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 25.0, bottom: 40),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Row(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     'Dashboard'.tr,
        //                     style: GoogleFonts.playfairDisplay(
        //                       fontSize: 22.0,
        //                       color: MyColors.black,
        //                       letterSpacing: 0,
        //                       fontWeight: FontWeight.w700,
        //                     ),
        //                   ),
        //                   Row(
        //                     children: [
        //                       Image.asset(
        //                         "assets/common/notification.png",
        //                         height: 25,
        //                       ),
        //                       const SizedBox(
        //                         width: 15,
        //                       ),
        //                       GestureDetector(
        //                         onTap: () {
        //                           dashboardController.goto("/wallet");
        //                         },
        //                         child: Image.asset(
        //                           "assets/common/wallet.png",
        //                           height: 25,
        //                           color: MyColors.black,
        //                         ),
        //                       ),
        //                       const SizedBox(
        //                         width: 15,
        //                       ),
        //                       GestureDetector(
        //                         onTap: () {
        //                           dashboardController.goto("/language");
        //                         },
        //                         child: Image.asset(
        //                           "assets/common/lang.png",
        //                           height: 25,
        //                           color: MyColors.black,
        //                         ),
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Flexible(
          flex: 1,
          child: CustomRefreshIndicator(
            onRefresh: dashboardController.onRefresh,
            builder: MaterialIndicatorDelegate(
              builder: (context, controller) {
                return Image.asset(
                  "assets/essential/loading.png",
                  height: 30,
                );
              },
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Column(
                  children: [
                    if(dashboardController.session!=null)
                      getActiveSession(context),
                    getStatus(context),
                    getTotalMinutes(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(flex: 1, child: getAvgDailyMinutes()),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(flex: 1, child: getAvgMonthlyMinutes()),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    getRatings(),
                    SizedBox(
                      height: 10,
                    ),
                    getTotalUserRated(),
                    SizedBox(
                      height: 10,
                    ),
                    getMonthlyMinuteSummary("Chat".tr),
                    SizedBox(
                      height: 10,
                    ),
                    getMonthlyMinuteSummary("Call".tr),
                    SizedBox(
                      height: 10,
                    ),
                    getMonthlySummary("Chat".tr),
                    SizedBox(
                      height: 10,
                    ),
                    getMonthlySummary("Call".tr),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getTotalMinutes() {
    return IgnorePointer(
      child: SfCartesianChart(
          title: ChartTitle(
            text: "Total Minutes".tr,
              textStyle: GoogleFonts.manrope(
              )
          ),
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(
              width: 0
            )
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            minimum: 0,
            maximum: dashboardController.getMaximum(dashboardController.total_mins)+(dashboardController.getInterval(dashboardController.total_mins)*2),
            interval: dashboardController.getInterval(dashboardController.total_mins),
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
          ),
          enableSideBySideSeriesPlacement: false,
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: dashboardController.total_mins,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => dashboardController.getColor(data.y, dashboardController.total_mins),
              width: 0.2,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
            ),
          ]
      ),
    );
  }

  Widget getAvgDailyMinutes() {
    return IgnorePointer(
      child: SfCartesianChart(
          title: ChartTitle(
            text: "Avg. Daily Minutes".tr,
            textStyle: GoogleFonts.manrope(
            )
          ),
          primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(
                  width: 0
              )
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            minimum: 0,
            maximum: dashboardController.getMaximum(dashboardController.avg_daily_mins)+(dashboardController.getInterval(dashboardController.avg_daily_mins)*2),
            interval: dashboardController.getInterval(dashboardController.avg_daily_mins)
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
          ),
          enableSideBySideSeriesPlacement: false,
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: dashboardController.avg_daily_mins,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => dashboardController.getColor(data.y, dashboardController.avg_daily_mins),
              width: 0.2,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
            ),
          ]
      ),
    );
  }

  Widget getAvgMonthlyMinutes() {
    return IgnorePointer(
      child: SfCartesianChart(
          title: ChartTitle(
            text: "Avg. Monthly Minutes".tr,
              textStyle: GoogleFonts.manrope(
              )
          ),
          primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(
                  width: 0
              )
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            minimum: 0,
            maximum: dashboardController.getMaximum(dashboardController.avg_monthly_mins)+(dashboardController.getInterval(dashboardController.avg_monthly_mins)*2),
            interval: dashboardController.getInterval(dashboardController.avg_monthly_mins)
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
          ),
          enableSideBySideSeriesPlacement: false,
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: dashboardController.avg_monthly_mins,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => dashboardController.getColor(data.y, dashboardController.avg_monthly_mins),
              width: 0.2,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
            ),
          ]
      ),
    );
  }

  Widget getRatings() {
    return IgnorePointer(
      child: SizedBox(
        height: 200,
        child: SfCartesianChart(
            title: ChartTitle(
              text: "Avg. Ratings".tr,
                textStyle: GoogleFonts.manrope(
                )
            ),
            primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(
                    width: 0
                )
            ),
            primaryYAxis: NumericAxis(
              isVisible: true,
              minimum: 0,
              maximum: 5,
              interval: 0.5
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            zoomPanBehavior: ZoomPanBehavior(
              enablePinching: true,
            ),
            enableSideBySideSeriesPlacement: false,
            series: <BarSeries<ChartData, String>>[
              BarSeries<ChartData, String>(
                dataSource: dashboardController.rating,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => dashboardController.getColor(data.y, dashboardController.rating),
                width: 0.2,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ),
              ),
            ]
        ),
      ),
    );
  }

  Widget getTotalUserRated() {
    return IgnorePointer(
      child: SfCartesianChart(
          title: ChartTitle(
            text: "Total Users Rated".tr,
              textStyle: GoogleFonts.manrope(
              )
          ),
          primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(
                  width: 0
              )
          ),
          primaryYAxis: NumericAxis(
            isVisible: true,
            minimum: 0,
            maximum: dashboardController.getMaximum(dashboardController.user_rating)+(dashboardController.getInterval(dashboardController.user_rating)*2),
            interval: dashboardController.getInterval(dashboardController.user_rating)
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
          ),
          enableSideBySideSeriesPlacement: false,
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: dashboardController.user_rating,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => dashboardController.getColor(data.y, dashboardController.user_rating),
              width: 0.15,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
            ),
          ]
      ),
    );
  }

  Widget getMonthlyMinuteSummary(String title) {
    return IgnorePointer(
      child: SfCircularChart(
        title: ChartTitle(
            text: "${'Last 12 Months Minutes Summary Report'.tr}  (${title})",
            textStyle: GoogleFonts.manrope(
            )
        ),
        legend: Legend( // Configure the legend
          isVisible: true, // Set to true to show the legend
          position: LegendPosition.bottom, // Adjust the position of the legend
        ),
        series: <CircularSeries>[
          RadialBarSeries<BasicReportModel, String>(
            dataSource: dashboardController.month_summary,
            xValueMapper: (BasicReportModel data, _) => dashboardController.getMinuteCategory(data.month, title=="Chat" ? data.total_chat_sec : data.total_call_sec),
            yValueMapper: (BasicReportModel data, _) => dashboardController.getTotalMinutes(title=="Chat" ? data.total_chat_sec : data.total_call_sec),
            pointColorMapper: (BasicReportModel data, _) => MyColors.months[dashboardController.getMonth(data.month)],
            // trackBorderWidth: 50,
            cornerStyle: CornerStyle.bothCurve,
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //   labelPosition: ChartDataLabelPosition.outside,
            //   labelAlignment: ChartDataLabelAlignment.bottom,
            // ),
          )
        ],
        palette: MyColors.months,
      ),
    );
  }

  Widget getMonthlySummary(String title) {
    return IgnorePointer(
      child: SfCircularChart(
        title: ChartTitle(
            text: "${'Last 12 Months Total'.tr} ${title} ${'Summary Report'.tr}",
            textStyle: GoogleFonts.manrope(
            )
        ),
        legend: Legend( // Configure the legend
          isVisible: true, // Set to true to show the legend
          position: LegendPosition.bottom, // Adjust the position of the legend
        ),
        series: <CircularSeries>[
          RadialBarSeries<BasicReportModel, String>(
            dataSource: dashboardController.month_summary,
            xValueMapper: (BasicReportModel data, _) => dashboardController.getCategory(data.month, title=="Chat" ? data.total_chat : data.total_call),
            yValueMapper: (BasicReportModel data, _) => title=="Chat" ? data.total_chat_sec : data.total_call,
            pointColorMapper: (BasicReportModel data, _) => MyColors.months[dashboardController.getMonth(data.month)],
            // trackBorderWidth: 50,
            cornerStyle: CornerStyle.bothCurve,
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //   labelPosition: ChartDataLabelPosition.outside,
            //   labelAlignment: ChartDataLabelAlignment.bottom,
            // ),
          )
        ],
        palette: MyColors.months,
      ),
    );
  }

  Widget getActiveSession(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(dashboardController.session?.category=="CHAT") {
          dashboardController.goto(
              "/chat",
              arguments: {
                "type" : dashboardController.session?.status,
                "action" : dashboardController.session?.status=="ACTIVE" ? dashboardController.session?.status : "NOT DECIDED",
                "user_id" : dashboardController.session?.user_id,
                "ch_id" : dashboardController.session?.id,
                "session_history" : dashboardController.session,
                "user" : UserModel(
                    id: dashboardController.session?.user_id??-1,
                    name: dashboardController.session?.user??"",
                    profile: dashboardController.session?.user_profile??""
                )
              }
          );
        }
        else {
          dashboardController.goto("/call",
              arguments: {
                "type": dashboardController.session?.status,
                "action" : dashboardController.session?.status=="ACTIVE" ? dashboardController.session?.status : "NOT DECIDED",
                "astro_id": dashboardController.session?.astro_id,
                "session_history": dashboardController.session,
                "user": UserModel(
                    id: dashboardController.session?.user_id ?? -1,
                    name: dashboardController.session?.user ?? "",
                    profile: dashboardController.session?.user_profile ?? "",
                    mobile: ''
                ),
                "meetingID": dashboardController.session?.meeting_id,
                "ch_id": dashboardController.session?.id
              }
          );
        }
      },
      child: Container(
          width: MySize.size100(context),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          margin: EdgeInsets.only(bottom: 20, top: 10, left: standardHorizontalPagePadding, right: standardHorizontalPagePadding),
          decoration: BoxDecoration(
            color: (dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess).withOpacity(0.2),
            border: Border.all(
              color: dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  (dashboardController.session?.astro_profile??"").isNotEmpty ?
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        ApiConstants.userUrl+(dashboardController.session?.astro_profile??"")
                    ),
                  )
                  : CircleAvatar(
                    radius: 25,
                    child: Text(
                      (dashboardController.session?.user??" ").substring(0, 1).toUpperCase(),
                      style: GoogleFonts.manrope(
                        color: MyColors.colorButton
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dashboardController.session?.astrologer??"",
                        style: GoogleFonts.manrope(
                            color: MyColors.labelColor(),
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        (dashboardController.session?.status=="ACTIVE " ? dashboardController.session?.status??"" : "")+(dashboardController.session?.category??"")+
                            (dashboardController.session?.status=="ACTIVE" ? "" : " REQUEST"),
                        style: GoogleFonts.manrope(
                            color: dashboardController.session?.category=="CHAT" ? MyColors.colorChat : MyColors.colorSuccess,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget getStatus(BuildContext context) {
    return Column(
      children: [
        getStatusDesign("Online".tr, "online", dashboardController.report.online==1, dashboardController.lload, context),
        getStatusDesign("Free Session".tr, "free", dashboardController.report.free==1, dashboardController.fload, context),
        getStatusDesign("Offers".tr, "offer", dashboardController.report.offer==1, dashboardController.oload, context)
      ],
    );
  }

  Widget getStatusDesign(String title, String key, bool status,  bool load, BuildContext context) {
    return Card(
      color: MyColors.cardColor(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.labelColor()
                    ),
                  ),
                  Switch(
                    value: status,
                    activeColor: load ? MyColors.colorOn.withOpacity(0.3) : MyColors.colorOn,
                    inactiveTrackColor: load ? MyColors.colorOff.withOpacity(0.3) : MyColors.colorOff,
                    onChanged: (value) {
                      dashboardController.toggleStatus(key, value);
                    },
                  ),
                ],
              ),
            ),
            if(load)
              LoadingAnimationWidget.dotsTriangle(
                color: status ? MyColors.colorOn : MyColors.colorOff, size: 12
              )
          ],
        ),
      ),
    );
  }
}