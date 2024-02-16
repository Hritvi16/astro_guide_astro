// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VimshottariDashaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VimshottariDashaModelImpl _$$VimshottariDashaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VimshottariDashaModelImpl(
      date: json['date'] as String,
      time: json['time'] as String,
      maha_dasha: VimMahaDashaModel.fromJson(
          json['maha_dasha'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VimshottariDashaModelImplToJson(
        _$VimshottariDashaModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'maha_dasha': instance.maha_dasha,
    };
