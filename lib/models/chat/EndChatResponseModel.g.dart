// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EndChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EndChatResponseModel _$$_EndChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_EndChatResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      seconds: json['seconds'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      chat_type: json['chat_type'] as String?,
    );

Map<String, dynamic> _$$_EndChatResponseModelToJson(
        _$_EndChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'seconds': instance.seconds,
      'amount': instance.amount,
      'chat_type': instance.chat_type,
    };
