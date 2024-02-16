// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StorageKundliModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageKundliModelImpl _$$StorageKundliModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StorageKundliModelImpl(
      basic: BasicKundliModel.fromJson(json['basic'] as Map<String, dynamic>),
      planet: (json['planet'] as List<dynamic>)
          .map((e) => PlanetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      kpPlanet: (json['kpPlanet'] as List<dynamic>)
          .map((e) => KPPlanetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      vimshottari: VimshottariDashaModel.fromJson(
          json['vimshottari'] as Map<String, dynamic>),
      yogini: YoginiDashaModel.fromJson(json['yogini'] as Map<String, dynamic>),
      charts: (json['charts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ChartModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$StorageKundliModelImplToJson(
        _$StorageKundliModelImpl instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'planet': instance.planet,
      'kpPlanet': instance.kpPlanet,
      'vimshottari': instance.vimshottari,
      'yogini': instance.yogini,
      'charts': instance.charts,
    };
