// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionResponseModel _$$_SessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SessionResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
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

Map<String, dynamic> _$$_SessionResponseModelToJson(
        _$_SessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'user': instance.user,
      'session_history': instance.session_history,
      'review': instance.review,
      'wallet': instance.wallet,
    };
