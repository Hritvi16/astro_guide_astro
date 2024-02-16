// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LanguageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageModelImpl _$$LanguageModelImplFromJson(Map<String, dynamic> json) =>
    _$LanguageModelImpl(
      id: json['id'] as int,
      lang: json['lang'] as String,
      type: json['type'] as String?,
      load: json['load'] as bool?,
    );

Map<String, dynamic> _$$LanguageModelImplToJson(_$LanguageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lang': instance.lang,
      'type': instance.type,
      'load': instance.load,
    };
