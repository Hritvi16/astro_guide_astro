// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckChatResponseModel _$$_CheckChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CheckChatResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CheckChatModel.fromJson(json['data'] as Map<String, dynamic>),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      started_at: json['started_at'] as String?,
      rate: json['rate'] as int?,
      type: json['type'] as String?,
      wallet: (json['wallet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CheckChatResponseModelToJson(
        _$_CheckChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'cities': instance.cities,
      'started_at': instance.started_at,
      'rate': instance.rate,
      'type': instance.type,
      'wallet': instance.wallet,
    };
