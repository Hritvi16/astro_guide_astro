// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingResponseModel _$$_SettingResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SettingResponseModel(
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

Map<String, dynamic> _$$_SettingResponseModelToJson(
        _$_SettingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'astrologer': instance.astrologer,
    };
