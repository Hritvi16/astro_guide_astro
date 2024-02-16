// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TypeModelImpl _$$TypeModelImplFromJson(Map<String, dynamic> json) =>
    _$TypeModelImpl(
      id: json['id'] as int,
      type: json['type'] as String,
      t_type: json['t_type'] as String?,
      load: json['load'] as bool?,
    );

Map<String, dynamic> _$$TypeModelImplToJson(_$TypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      't_type': instance.t_type,
      'load': instance.load,
    };
