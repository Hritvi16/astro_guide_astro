// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChartResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartResponseModelImpl _$$ChartResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChartResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ChartModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChartResponseModelImplToJson(
        _$ChartResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
