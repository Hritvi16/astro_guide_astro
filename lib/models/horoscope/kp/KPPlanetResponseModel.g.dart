// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KPPlanetResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KPPlanetResponseModelImpl _$$KPPlanetResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KPPlanetResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : KPPlanetTableModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KPPlanetResponseModelImplToJson(
        _$KPPlanetResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
