// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListModelImpl _$$ChatListModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatListModelImplToJson(_$ChatListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
