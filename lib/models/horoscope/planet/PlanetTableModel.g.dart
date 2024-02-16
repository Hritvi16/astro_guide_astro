// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlanetTableModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanetTableModelImpl _$$PlanetTableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PlanetTableModelImpl(
      date: json['date'] as String,
      time: json['time'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      timezone: json['timezone'] as String,
      planets: (json['planets'] as List<dynamic>)
          .map((e) => PlanetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PlanetTableModelImplToJson(
        _$PlanetTableModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'planets': instance.planets,
    };
