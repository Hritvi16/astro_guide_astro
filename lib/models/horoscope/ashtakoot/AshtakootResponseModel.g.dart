// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AshtakootResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AshtakootResponseModelImpl _$$AshtakootResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AshtakootResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AshtakootModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AshtakootResponseModelImplToJson(
        _$AshtakootResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
