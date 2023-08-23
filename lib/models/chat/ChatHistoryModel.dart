import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatHistoryModel.freezed.dart';
part 'ChatHistoryModel.g.dart';


@freezed
class ChatHistoryModel with _$ChatHistoryModel {
  factory ChatHistoryModel({
    required int id,
    required int sess_id,
    int? k_id,
    required String status,
    String? reason,
    String? started_at,
    String? ended_at,
    required int rate,
    double? amount,
    required double commission,
    required String type,
    required String requested_at,
    String? waitlisted_at,
    String? cancelled_at,
    required String updated_at,
    int? user_id,
    String? user,
    double? rating,
    String? review,
    String? reviewed_at,
    int? anonymous,
  }) = _ChatHistoryModel;

  factory ChatHistoryModel.fromJson(JSON json) => _$ChatHistoryModelFromJson(json);
}

