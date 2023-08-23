import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatMissedModel.freezed.dart';
part 'ChatMissedModel.g.dart';


@freezed
class ChatMissedModel with _$ChatMissedModel {
  factory ChatMissedModel({
    required String status,
    required int code,
    required String message,
    required int ch_id,
    SessionHistoryModel? data,
    UserModel? user
  }) = _ChatMissedModel;

  factory ChatMissedModel.fromJson(JSON json) => _$ChatMissedModelFromJson(json);
}

