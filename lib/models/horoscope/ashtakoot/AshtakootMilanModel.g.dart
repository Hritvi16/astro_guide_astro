// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AshtakootMilanModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AshtakootMilanModelImpl _$$AshtakootMilanModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AshtakootMilanModelImpl(
      p1: json['p1'] as String,
      p2: json['p2'] as String,
      points_obtained: (json['points_obtained'] as num).toDouble(),
      max_ponits: (json['max_ponits'] as num).toDouble(),
      area_of_life: json['area_of_life'] as String,
    );

Map<String, dynamic> _$$AshtakootMilanModelImplToJson(
        _$AshtakootMilanModelImpl instance) =>
    <String, dynamic>{
      'p1': instance.p1,
      'p2': instance.p2,
      'points_obtained': instance.points_obtained,
      'max_ponits': instance.max_ponits,
      'area_of_life': instance.area_of_life,
    };
