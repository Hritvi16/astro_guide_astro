// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatDetailModel _$$_ChatDetailModelFromJson(Map<String, dynamic> json) =>
    _$_ChatDetailModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      session_history: json['session_history'] == null
          ? null
          : SessionHistoryModel.fromJson(
              json['session_history'] as Map<String, dynamic>),
      review: json['review'] == null
          ? null
          : ReviewModel.fromJson(json['review'] as Map<String, dynamic>),
      wallet: (json['wallet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ChatDetailModelToJson(_$_ChatDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'user': instance.user,
      'session_history': instance.session_history,
      'review': instance.review,
      'wallet': instance.wallet,
    };
