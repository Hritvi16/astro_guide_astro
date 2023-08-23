// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerLanguageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerLanguageModel _$$_AstrologerLanguageModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerLanguageModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerLanguageModelToJson(
        _$_AstrologerLanguageModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'languages': instance.languages,
    };
