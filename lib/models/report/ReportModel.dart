import 'package:astro_guide_astro/models/report/BasicReportModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReportModel.freezed.dart';
part 'ReportModel.g.dart';


@freezed
class ReportModel with _$ReportModel {
  factory ReportModel({
    required int total_chat_sec,
    required int total_call_sec,
    required int total_chat,
    required int total_call,
    required double total_chat_rating,
    required double total_call_rating,
    required int total_chat_user,
    required int total_call_user,
    required int free,
    required int online,
    required int offer,
    required String created_at,
    required String current_date,
    required List<BasicReportModel> month_summary,
  }) = _ReportModel;

  factory ReportModel.fromJson(JSON json) => _$ReportModelFromJson(json);
}

