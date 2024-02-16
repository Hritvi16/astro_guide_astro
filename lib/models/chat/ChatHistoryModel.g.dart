// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatHistoryModelImpl _$$ChatHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatHistoryModelImpl(
      id: json['id'] as int,
      sess_id: json['sess_id'] as int,
      k_id: json['k_id'] as int?,
      status: json['status'] as String,
      reason: json['reason'] as String?,
      started_at: json['started_at'] as String?,
      ended_at: json['ended_at'] as String?,
      rate: json['rate'] as int,
      amount: (json['amount'] as num?)?.toDouble(),
      commission: (json['commission'] as num).toDouble(),
      type: json['type'] as String,
      requested_at: json['requested_at'] as String,
      waitlisted_at: json['waitlisted_at'] as String?,
      cancelled_at: json['cancelled_at'] as String?,
      updated_at: json['updated_at'] as String,
      user_id: json['user_id'] as int?,
      user: json['user'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'] as String?,
      reviewed_at: json['reviewed_at'] as String?,
      anonymous: json['anonymous'] as int?,
    );

Map<String, dynamic> _$$ChatHistoryModelImplToJson(
        _$ChatHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sess_id': instance.sess_id,
      'k_id': instance.k_id,
      'status': instance.status,
      'reason': instance.reason,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'rate': instance.rate,
      'amount': instance.amount,
      'commission': instance.commission,
      'type': instance.type,
      'requested_at': instance.requested_at,
      'waitlisted_at': instance.waitlisted_at,
      'cancelled_at': instance.cancelled_at,
      'updated_at': instance.updated_at,
      'user_id': instance.user_id,
      'user': instance.user,
      'rating': instance.rating,
      'review': instance.review,
      'reviewed_at': instance.reviewed_at,
      'anonymous': instance.anonymous,
    };
