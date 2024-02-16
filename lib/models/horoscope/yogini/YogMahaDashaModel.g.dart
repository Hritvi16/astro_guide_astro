// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YogMahaDashaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YogMahaDashaModelImpl _$$YogMahaDashaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YogMahaDashaModelImpl(
      dasha: json['dasha'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      antar_dasha: YogAntarDashaModel.fromJson(
          json['antar_dasha'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$YogMahaDashaModelImplToJson(
        _$YogMahaDashaModelImpl instance) =>
    <String, dynamic>{
      'dasha': instance.dasha,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'antar_dasha': instance.antar_dasha,
    };
