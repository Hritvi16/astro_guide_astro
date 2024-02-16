// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatMissedModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMissedModelImpl _$$ChatMissedModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMissedModelImpl(
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

Map<String, dynamic> _$$ChatMissedModelImplToJson(
        _$ChatMissedModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'ch_id': instance.ch_id,
      'data': instance.data,
      'wallet': instance.wallet,
      'user': instance.user,
    };
