// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChartDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartDataModelImpl _$$ChartDataModelImplFromJson(Map<String, dynamic> json) =>
    _$ChartDataModelImpl(
      sign_no: json['sign_no'],
      planet: (json['planet'] as List<dynamic>)
          .map((e) => PlanetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChartDataModelImplToJson(
        _$ChartDataModelImpl instance) =>
    <String, dynamic>{
      'sign_no': instance.sign_no,
      'planet': instance.planet,
    };
