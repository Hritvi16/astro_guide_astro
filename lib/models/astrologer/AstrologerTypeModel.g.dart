// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerTypeModel _$$_AstrologerTypeModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerTypeModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerTypeModelToJson(
        _$_AstrologerTypeModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'types': instance.types,
    };
