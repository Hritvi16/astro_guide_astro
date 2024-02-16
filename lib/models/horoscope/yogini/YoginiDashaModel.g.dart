// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoginiDashaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoginiDashaModelImpl _$$YoginiDashaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YoginiDashaModelImpl(
      date: json['date'] as String,
      time: json['time'] as String,
      maha_dasha: (json['maha_dasha'] as List<dynamic>)
          .map((e) => YogMahaDashaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$YoginiDashaModelImplToJson(
        _$YoginiDashaModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'maha_dasha': instance.maha_dasha,
    };
