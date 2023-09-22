import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionMissedModel.freezed.dart';
part 'SessionMissedModel.g.dart';


@freezed
class SessionMissedModel with _$SessionMissedModel {
  factory SessionMissedModel({
    required String status,
    required int code,
    required String message,
    required int ch_id,
    SessionHistoryModel? data,
    double? wallet,
    UserModel? user
  }) = _SessionMissedModel;

  factory SessionMissedModel.fromJson(JSON json) => _$SessionMissedModelFromJson(json);
}

