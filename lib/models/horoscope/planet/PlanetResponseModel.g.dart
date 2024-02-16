// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlanetResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanetResponseModelImpl _$$PlanetResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlanetResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PlanetTableModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlanetResponseModelImplToJson(
        _$PlanetResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
