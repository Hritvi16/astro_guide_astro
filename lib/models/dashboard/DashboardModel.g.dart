// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashboardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ReportModel.fromJson(json['data'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : SessionHistoryModel.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'session': instance.session,
    };
