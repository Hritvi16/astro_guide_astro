// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VimMahaDashaDateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VimMahaDashaDateModelImpl _$$VimMahaDashaDateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VimMahaDashaDateModelImpl(
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      antar_dasha: json['antar_dasha'] == null
          ? null
          : VimMahaDashaModel.fromJson(
              json['antar_dasha'] as Map<String, dynamic>),
      pratyantar_dasha: json['pratyantar_dasha'] == null
          ? null
          : VimMahaDashaModel.fromJson(
              json['pratyantar_dasha'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VimMahaDashaDateModelImplToJson(
        _$VimMahaDashaDateModelImpl instance) =>
    <String, dynamic>{
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'antar_dasha': instance.antar_dasha,
      'pratyantar_dasha': instance.pratyantar_dasha,
    };
