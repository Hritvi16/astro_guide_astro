// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VimshottariDashaResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VimshottariDashaResponseModelImpl
    _$$VimshottariDashaResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$VimshottariDashaResponseModelImpl(
          status: json['status'] as String,
          code: json['code'] as int,
          message: json['message'] as String,
          data: json['data'] == null
              ? null
              : VimshottariDashaModel.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$VimshottariDashaResponseModelImplToJson(
        _$VimshottariDashaResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
