// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoginiDashaResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoginiDashaResponseModelImpl _$$YoginiDashaResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$YoginiDashaResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : YoginiDashaModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$YoginiDashaResponseModelImplToJson(
        _$YoginiDashaResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
