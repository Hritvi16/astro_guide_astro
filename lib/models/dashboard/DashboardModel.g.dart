// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashboardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardModel _$$_DashboardModelFromJson(Map<String, dynamic> json) =>
    _$_DashboardModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ReportModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DashboardModelToJson(_$_DashboardModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
