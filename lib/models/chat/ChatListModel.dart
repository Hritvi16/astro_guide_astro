import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatListModel.freezed.dart';
part 'ChatListModel.g.dart';


@freezed
class ChatListModel with _$ChatListModel {
  factory ChatListModel({
    required String status,
    required int code,
    required String message,
    List<ChatHistoryModel>? data,
  }) = _ChatListModel;

  factory ChatListModel.fromJson(JSON json) => _$ChatListModelFromJson(json);
}

