// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerTypeModelImpl _$$AstrologerTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerTypeModelImpl(
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

Map<String, dynamic> _$$AstrologerTypeModelImplToJson(
        _$AstrologerTypeModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'types': instance.types,
    };
