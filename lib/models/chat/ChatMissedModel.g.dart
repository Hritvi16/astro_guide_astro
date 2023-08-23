// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatMissedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMissedModel _$$_ChatMissedModelFromJson(Map<String, dynamic> json) =>
    _$_ChatMissedModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      ch_id: json['ch_id'] as int,
      data: json['data'] == null
          ? null
          : SessionHistoryModel.fromJson(json['data'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatMissedModelToJson(_$_ChatMissedModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'ch_id': instance.ch_id,
      'data': instance.data,
      'user': instance.user,
    };
