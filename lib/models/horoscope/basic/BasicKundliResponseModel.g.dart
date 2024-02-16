// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BasicKundliResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicKundliResponseModelImpl _$$BasicKundliResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BasicKundliResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : BasicKundliModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BasicKundliResponseModelImplToJson(
        _$BasicKundliResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
