// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerSpecModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerSpecModel _$$_AstrologerSpecModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerSpecModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specs: (json['specs'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerSpecModelToJson(
        _$_AstrologerSpecModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'specs': instance.specs,
    };
