// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserListModel _$$_UserListModelFromJson(Map<String, dynamic> json) =>
    _$_UserListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserListModelToJson(_$_UserListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
