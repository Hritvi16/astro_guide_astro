// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AshtakootMilanResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AshtakootMilanResultModelImpl _$$AshtakootMilanResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AshtakootMilanResultModelImpl(
      points_obtained: (json['points_obtained'] as num).toDouble(),
      max_ponits: (json['max_ponits'] as num).toDouble(),
      is_compatible: json['is_compatible'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$AshtakootMilanResultModelImplToJson(
        _$AshtakootMilanResultModelImpl instance) =>
    <String, dynamic>{
      'points_obtained': instance.points_obtained,
      'max_ponits': instance.max_ponits,
      'is_compatible': instance.is_compatible,
      'content': instance.content,
    };
