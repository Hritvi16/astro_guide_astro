// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BasicReportModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicReportModel _$$_BasicReportModelFromJson(Map<String, dynamic> json) =>
    _$_BasicReportModel(
      month: json['month'] as String,
      total_chat_sec: json['total_chat_sec'] as int,
      total_call_sec: json['total_call_sec'] as int,
      total_chat: json['total_chat'] as int,
      total_call: json['total_call'] as int,
    );

Map<String, dynamic> _$$_BasicReportModelToJson(_$_BasicReportModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'total_chat_sec': instance.total_chat_sec,
      'total_call_sec': instance.total_call_sec,
      'total_chat': instance.total_chat,
      'total_call': instance.total_call,
    };
