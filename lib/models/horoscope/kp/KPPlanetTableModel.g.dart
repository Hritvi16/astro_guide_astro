// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KPPlanetTableModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KPPlanetTableModelImpl _$$KPPlanetTableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KPPlanetTableModelImpl(
      table_data: (json['table_data'] as List<dynamic>)
          .map((e) => KPPlanetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$KPPlanetTableModelImplToJson(
        _$KPPlanetTableModelImpl instance) =>
    <String, dynamic>{
      'table_data': instance.table_data,
    };
