// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerLanguageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerLanguageModelImpl _$$AstrologerLanguageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerLanguageModelImpl(
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

Map<String, dynamic> _$$AstrologerLanguageModelImplToJson(
        _$AstrologerLanguageModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'languages': instance.languages,
    };
