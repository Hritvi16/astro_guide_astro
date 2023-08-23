import 'package:astro_guide_astro/models/chat/ChatModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'EndChatResponseModel.freezed.dart';
part 'EndChatResponseModel.g.dart';


@freezed
class EndChatResponseModel with _$EndChatResponseModel {
  factory EndChatResponseModel({
    required String status,
    required int code,
    required String message,
    int? seconds,
    double? amount,
    String? chat_type
  }) = _EndChatResponseModel;

  factory EndChatResponseModel.fromJson(JSON json) => _$EndChatResponseModelFromJson(json);
}

