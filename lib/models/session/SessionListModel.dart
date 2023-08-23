import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionListModel.freezed.dart';
part 'SessionListModel.g.dart';


@freezed
class SessionListModel with _$SessionListModel {
  factory SessionListModel({
    required String status,
    required int code,
    required String message,
    List<ChatModel>? data,
    AstrologerModel? astrologer,
    SessionHistoryModel? session_history,
    double? wallet
  }) = _SessionListModel;

  factory SessionListModel.fromJson(JSON json) => _$SessionListModelFromJson(json);
}

