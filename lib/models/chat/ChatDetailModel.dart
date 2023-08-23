import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatDetailModel.freezed.dart';
part 'ChatDetailModel.g.dart';


@freezed
class ChatDetailModel with _$ChatDetailModel {
  factory ChatDetailModel({
    required String status,
    required int code,
    required String message,
    List<ChatModel>? data,
    UserModel? user,
    SessionHistoryModel? session_history,
    ReviewModel? review,
    double? wallet
  }) = _ChatDetailModel;

  factory ChatDetailModel.fromJson(JSON json) => _$ChatDetailModelFromJson(json);
}

