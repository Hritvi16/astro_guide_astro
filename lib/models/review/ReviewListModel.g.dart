// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewListModelImpl _$$ReviewListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReviewListModelImplToJson(
        _$ReviewListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
