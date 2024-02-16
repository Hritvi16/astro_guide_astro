// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecModelImpl _$$SpecModelImplFromJson(Map<String, dynamic> json) =>
    _$SpecModelImpl(
      id: json['id'] as int,
      spec: json['spec'] as String,
      icon: json['icon'] as String?,
      load: json['load'] as bool?,
    );

Map<String, dynamic> _$$SpecModelImplToJson(_$SpecModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spec': instance.spec,
      'icon': instance.icon,
      'load': instance.load,
    };
