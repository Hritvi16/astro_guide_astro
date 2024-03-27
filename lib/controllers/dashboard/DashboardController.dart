import 'dart:ui';

import 'package:astro_guide_astro/colors/MyColors.dart';
import 'package:astro_guide_astro/essential/Essential.dart';
import 'package:astro_guide_astro/models/chartData/ChartData.dart';
import 'package:astro_guide_astro/models/report/BasicReportModel.dart';
import 'package:astro_guide_astro/models/report/ReportModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/notifier/GlobalNotifier.dart';
import 'package:astro_guide_astro/providers/AstrologerProvider.dart';
import 'package:astro_guide_astro/providers/DashboardProvider.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:astro_guide_astro/repositories/DashboardRepository.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  DashboardController();

  final storage = GetStorage();

  final DashboardRepository dashboardRepository = Get.put(DashboardRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late DashboardProvider dashboardProvider;

  final AstrologerRepository astrologerRepository = Get.put(AstrologerRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late AstrologerProvider astrologerProvider;

  late ReportModel report;
  late List<BasicReportModel> month_summary;
  late List<ChartData> total_mins;
  late List<ChartData> avg_daily_mins;
  late List<ChartData> avg_monthly_mins;
  late List<ChartData> rating;
  late List<ChartData> user_rating;
  late bool load;
  late bool lload;
  late bool fload;
  late bool oload;

  SessionHistoryModel? session;

  final GlobalNotifier globalNotifier = Get.find();

  @override
  void onInit() {
    super.onInit();
    globalNotifier.showSession.listen((value) {
      updateDashboard(value);
    });
    dashboardProvider = Get.put(DashboardProvider(dashboardRepository));
    astrologerProvider = Get.put(AstrologerProvider(astrologerRepository));
    month_summary = [];
    total_mins = [];
    avg_daily_mins = [];
    avg_monthly_mins = [];
    rating = [];
    user_rating = [];
    load = false;
    lload = false;
    fload = false;
    oload = false;
    start();
  }

  void updateDashboard(value) {
    print("sswebnotifier dashboard: $value");
    if(globalNotifier.showSession.value=="session") {
      getDashboard();
      globalNotifier.updateValue("");
    }
  }

  start() {
    getDashboard();
  }

  Future<void> getDashboard() async {
    await dashboardProvider.fetch(storage.read("access"), ApiConstants.astrologerAPI).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        report = response.data!;
        month_summary.addAll(report.month_summary);
        session = response.session;
        update();
        calculate();
      }
      else if(response.code!=-1){
        Essential.showSnackBar(response.message);
      }
    });
  }


  Future<void> updateStatus(String type, int value, ReportModel temp) async {
    Map<String, dynamic> data = {
      "type" : type,
      "value" : value
    };

    print(data);

    await astrologerProvider.updateStatus(storage.read("access"), ApiConstants.visibility, data).then((response) async {
      print(response.toJson());
      type=="online" ? lload = false : type=="free" ? fload = false : oload = false;
      if(response.code==1) {
      }
      else if(response.code!=-1){
        report = temp;
        Essential.showSnackBar(response.message);
      }
      update();
    });
  }



  @override
  void dispose() {
    super.dispose();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getDashboard();
    });
  }

  void calculate() {
    // print("Total Chat Minutes:- ${getTotalMinutes(report.total_chat_sec)}");
    // print("Total Call Minutes:- ${getTotalMinutes(report.total_call_sec)}");
    //
    // print("Avg Daily Chat Minutes:- ${getAvgDailyMinutes(report.total_chat_sec)}");
    // print("Avg Daily Call Minutes:- ${getAvgDailyMinutes(report.total_call_sec)}");
    //
    // print("Avg Monthly Chat Minutes:- ${getAvgMonthMinutes(report.total_chat_sec)}");
    // print("Avg Monthly Call Minutes:- ${getAvgMonthMinutes(report.total_call_sec)}");

    total_mins = [
        ChartData("Chat".tr, getTotalMinutes(report.total_chat_sec)),
        ChartData("Call".tr, getTotalMinutes(report.total_call_sec)),
      ];

    avg_daily_mins = [
        ChartData("Chat".tr, getAvgDailyMinutes(report.total_chat_sec)),
        ChartData("Call".tr, getAvgDailyMinutes(report.total_call_sec)),
      ];

    avg_monthly_mins = [
        ChartData("Chat".tr, getAvgMonthMinutes(report.total_chat_sec)),
        ChartData("Call".tr, getAvgMonthMinutes(report.total_call_sec)),
      ];

    rating = [
        ChartData("Chat".tr, getAvgRating(report.total_chat_rating, report.total_chat_user)),
        ChartData("Call".tr, getAvgRating(report.total_call_rating, report.total_call_user)),
      ];

    user_rating = [
        ChartData("Chat".tr, report.total_chat_user.toDouble()),
        ChartData("Call".tr, report.total_call_user.toDouble()),
      ];

    // chart.addAll(
    //   [
    //     ChartData("1", getTotalMinutes(report.total_chat_sec)),
    //     ChartData("2", getTotalMinutes(report.total_call_sec)),
    //     ChartData("3", getAvgDailyMinutes(report.total_chat_sec)),
    //     ChartData("4", getAvgDailyMinutes(report.total_call_sec)),
    //     ChartData("5", getAvgMonthMinutes(report.total_chat_sec)),
    //     ChartData("6", getAvgMonthMinutes(report.total_call_sec)),
    //   ]
    // );

    load = true;
    update();

  }
  
  double getTotalMinutes(int seconds) {
    print(seconds);
    return getPrecision(seconds/60, 2);
  }

  double getAvgDailyMinutes(int seconds) {
    return getPrecision(getTotalMinutes(seconds)/getDays(), 2);
  }

  int getDays() {
    return Essential.getDaysDifference(report.created_at);
  }

  double getAvgMonthMinutes(int seconds) {
    return getPrecision(getTotalMinutes(seconds)/getMonths(), 2);
  }

  double getPrecision(double value, int precision) {
    if(value.isNaN || value.isInfinite) {
      value = 0;
    }
    print(value);
    return value.toPrecision(precision);
  }

  int getMonths() {
    return Essential.getMonthsDifference(report.created_at);
  }

  bool getEqual(List<ChartData> chart) {
    return chart.first.y==chart[1].y ? true : false;
  }

  double getMaximum(List<ChartData> chart) {
    double max = 0;
    for (var element in chart) {
      if(element.y>max) {
        max = element.y;
      }
    }
    return max;
  }


  double getMinimum(List<ChartData> chart) {
    double min = chart.first.y;
    for (var element in chart) {
      if(element.y<min) {
        min = element.y;
      }
    }
    return min;
  }

  double getInterval(List<ChartData> chart) {
    double max = getMaximum(chart);
    double min = getMinimum(chart);
    double difference = max - min;
    return getCriteria(difference);
  }

  double getCriteria(double difference) {
    if(difference<=100) {
      return 10;
    }
    else if(difference<=500) {
      return 50;
    }
    else if(difference<=1000) {
      return 100;
    }
    else if(difference<=5000) {
      return 500;
    }
    else if(difference<=10000) {
      return 1000;
    }
    else if(difference<=25000) {
      return 2000;
    }
    else if(difference<=50000) {
      return 5000;
    }
    else if(difference<=75000) {
      return 7000;
    }
    else if(difference<=100000) {
      return 10000;
    }
    else if(difference<=250000) {
      return 20000;
    }
    else if(difference<=500000) {
      return 50000;
    }
    else if(difference<=750000) {
      return 70000;
    }
    else {
      return 100000;
    }
  }

  Color getColor(double y, List<ChartData> chart) {
    if(getEqual(chart)) {
      return MyColors.colorButton;
    }
    else if(y==getMaximum(chart)) {
      return MyColors.colorSuccess;
    }
    else {
      return MyColors.colorError;
    }
  }

  double getAvgRating(double rating, int user) {
    print(rating);
    print(user);
    print(rating/user);
    return (rating/user).isNaN ? 0 : rating/user;
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getDashboard();
  }

  Future<void> toggleStatus(String type, bool value) async {
    ReportModel temp = report;
    if(type=="online") {
      report = report.copyWith(
        online: value ? 1 : 0
      );
      lload = true;
    }
    else if(type=="free") {
      report = report.copyWith(
        free: value ? 1 : 0
      );
      fload = true;
    }
    else {
      report = report.copyWith(
        offer: value ? 1 : 0
      );
      oload = true;
    }
    update();
    await Future.delayed(Duration(seconds: 3), () {
      updateStatus(type, value ? 1 : 0, temp);
    });
  }

  String getMinuteCategory(String month, int secs) {
    return DateFormat("MMM yyyy").format(DateTime.parse("$month-01"))+"  [${getTotalMinutes(secs)}]";
  }

  String getCategory(String month, int total) {
    return DateFormat("MMM yyyy").format(DateTime.parse("$month-01"))+"  [${total}]";
  }

  int getMonth(String month,) {
    return DateTime.parse("$month-01").month-1;
  }
}
