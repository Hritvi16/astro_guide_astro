// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckChatModelImpl _$$CheckChatModelImplFromJson(Map<String, dynamic> json) =>
    _$CheckChatModelImpl(
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      ci_id: json['ci_id'] as int?,
      marital_status: json['marital_status'] as String?,
      type: json['type'] as String?,
      info: json['info'] as String,
    );

Map<String, dynamic> _$$CheckChatModelImplToJson(
        _$CheckChatModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'dob': instance.dob,
      'ci_id': instance.ci_id,
      'marital_status': instance.marital_status,
      'type': instance.type,
      'info': instance.info,
    };
