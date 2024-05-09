// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReportModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      total_chat_sec: json['total_chat_sec'] as int,
      total_call_sec: json['total_call_sec'] as int,
      total_chat: json['total_chat'] as int,
      total_call: json['total_call'] as int,
      total_chat_rating: (json['total_chat_rating'] as num).toDouble(),
      total_call_rating: (json['total_call_rating'] as num).toDouble(),
      total_chat_user: json['total_chat_user'] as int,
      total_call_user: json['total_call_user'] as int,
      free: json['free'] as int,
      online: json['online'] as int,
      conline: json['conline'] as int,
      offer: json['offer'] as int,
      created_at: json['created_at'] as String,
      current_date: json['current_date'] as String,
      month_summary: (json['month_summary'] as List<dynamic>)
          .map((e) => BasicReportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'total_chat_sec': instance.total_chat_sec,
      'total_call_sec': instance.total_call_sec,
      'total_chat': instance.total_chat,
      'total_call': instance.total_call,
      'total_chat_rating': instance.total_chat_rating,
      'total_call_rating': instance.total_call_rating,
      'total_chat_user': instance.total_chat_user,
      'total_call_user': instance.total_call_user,
      'free': instance.free,
      'online': instance.online,
      'conline': instance.conline,
      'offer': instance.offer,
      'created_at': instance.created_at,
      'current_date': instance.current_date,
      'month_summary': instance.month_summary,
    };
