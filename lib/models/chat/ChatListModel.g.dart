// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatListModel _$$_ChatListModelFromJson(Map<String, dynamic> json) =>
    _$_ChatListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatListModelToJson(_$_ChatListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
