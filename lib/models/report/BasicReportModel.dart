import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicReportModel.freezed.dart';
part 'BasicReportModel.g.dart';


@freezed
class BasicReportModel with _$BasicReportModel {
  factory BasicReportModel({
    required String month,
    required int total_chat_sec,
    required int total_call_sec,
    required int total_chat,
    required int total_call,
  }) = _BasicReportModel;

  factory BasicReportModel.fromJson(JSON json) => _$BasicReportModelFromJson(json);
}

