import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionResponseModel.freezed.dart';
part 'SessionResponseModel.g.dart';


@freezed
class SessionResponseModel with _$SessionResponseModel {
  factory SessionResponseModel({
    required String status,
    required int code,
    required String message,
    UserModel? user,
    SessionHistoryModel? session_history,
    double? wallet
  }) = _SessionResponseModel;

  factory SessionResponseModel.fromJson(JSON json) => _$SessionResponseModelFromJson(json);
}

