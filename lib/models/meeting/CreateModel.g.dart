// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateModel _$$_CreateModelFromJson(Map<String, dynamic> json) =>
    _$_CreateModel(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      token: json['token'] as String?,
      meetingID: json['meetingID'] as String?,
    );

Map<String, dynamic> _$$_CreateModelToJson(_$_CreateModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'meetingID': instance.meetingID,
    };
