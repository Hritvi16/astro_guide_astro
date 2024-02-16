// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VimMahaDashaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VimMahaDashaModelImpl _$$VimMahaDashaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VimMahaDashaModelImpl(
      Mars:
          VimMahaDashaDateModel.fromJson(json['Mars'] as Map<String, dynamic>),
      Rahu:
          VimMahaDashaDateModel.fromJson(json['Rahu'] as Map<String, dynamic>),
      Jupiter: VimMahaDashaDateModel.fromJson(
          json['Jupiter'] as Map<String, dynamic>),
      Saturn: VimMahaDashaDateModel.fromJson(
          json['Saturn'] as Map<String, dynamic>),
      Mercury: VimMahaDashaDateModel.fromJson(
          json['Mercury'] as Map<String, dynamic>),
      Ketu:
          VimMahaDashaDateModel.fromJson(json['Ketu'] as Map<String, dynamic>),
      Venus:
          VimMahaDashaDateModel.fromJson(json['Venus'] as Map<String, dynamic>),
      Sun: VimMahaDashaDateModel.fromJson(json['Sun'] as Map<String, dynamic>),
      Moon:
          VimMahaDashaDateModel.fromJson(json['Moon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VimMahaDashaModelImplToJson(
        _$VimMahaDashaModelImpl instance) =>
    <String, dynamic>{
      'Mars': instance.Mars,
      'Rahu': instance.Rahu,
      'Jupiter': instance.Jupiter,
      'Saturn': instance.Saturn,
      'Mercury': instance.Mercury,
      'Ketu': instance.Ketu,
      'Venus': instance.Venus,
      'Sun': instance.Sun,
      'Moon': instance.Moon,
    };
