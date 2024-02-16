// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionMissedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionMissedModelImpl _$$SessionMissedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionMissedModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      ch_id: json['ch_id'] as int,
      data: json['data'] == null
          ? null
          : SessionHistoryModel.fromJson(json['data'] as Map<String, dynamic>),
      wallet: (json['wallet'] as num?)?.toDouble(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SessionMissedModelImplToJson(
        _$SessionMissedModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'ch_id': instance.ch_id,
      'data': instance.data,
      'wallet': instance.wallet,
      'user': instance.user,
    };
