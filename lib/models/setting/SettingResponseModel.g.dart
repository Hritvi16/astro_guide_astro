// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingResponseModelImpl _$$SettingResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SettingModel.fromJson(json['data'] as Map<String, dynamic>),
      astrologer: json['astrologer'] == null
          ? null
          : AstrologerModel.fromJson(
              json['astrologer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SettingResponseModelImplToJson(
        _$SettingResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'astrologer': instance.astrologer,
    };
