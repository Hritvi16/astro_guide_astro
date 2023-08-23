// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionMissedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionMissedModel _$$_SessionMissedModelFromJson(
        Map<String, dynamic> json) =>
    _$_SessionMissedModel(
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

Map<String, dynamic> _$$_SessionMissedModelToJson(
        _$_SessionMissedModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'ch_id': instance.ch_id,
      'data': instance.data,
      'user': instance.user,
    };
