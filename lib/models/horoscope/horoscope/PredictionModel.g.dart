// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PredictionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionModelImpl _$$PredictionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionModelImpl(
      personal: json['personal'] as String,
      health: json['health'] as String,
      profession: json['profession'] as String,
      emotions: json['emotions'] as String,
      travel: json['travel'] as String,
      luck: (json['luck'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PredictionModelImplToJson(
        _$PredictionModelImpl instance) =>
    <String, dynamic>{
      'personal': instance.personal,
      'health': instance.health,
      'profession': instance.profession,
      'emotions': instance.emotions,
      'travel': instance.travel,
      'luck': instance.luck,
    };
