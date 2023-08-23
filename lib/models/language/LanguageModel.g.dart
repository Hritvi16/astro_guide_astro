// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LanguageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LanguageModel _$$_LanguageModelFromJson(Map<String, dynamic> json) =>
    _$_LanguageModel(
      id: json['id'] as int,
      lang: json['lang'] as String,
      type: json['type'] as String?,
      load: json['load'] as bool?,
    );

Map<String, dynamic> _$$_LanguageModelToJson(_$_LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'type': instance.type,
      'load': instance.load,
    };
