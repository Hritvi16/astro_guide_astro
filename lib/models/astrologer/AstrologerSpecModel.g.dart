// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerSpecModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerSpecModelImpl _$$AstrologerSpecModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerSpecModelImpl(
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

Map<String, dynamic> _$$AstrologerSpecModelImplToJson(
        _$AstrologerSpecModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'specs': instance.specs,
    };
