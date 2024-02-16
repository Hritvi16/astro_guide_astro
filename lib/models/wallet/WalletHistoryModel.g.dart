// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletHistoryModelImpl _$$WalletHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletHistoryModelImpl(
      id: json['id'] as int,
      order_id: json['order_id'] as String,
      p_id: json['p_id'] as int?,
      amount: (json['amount'] as num).toDouble(),
      astro_amount: (json['astro_amount'] as num).toDouble(),
      type: json['type'] as String,
      t_type: json['t_type'] as String,
      astro_description: json['astro_description'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$WalletHistoryModelImplToJson(
        _$WalletHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'p_id': instance.p_id,
      'amount': instance.amount,
      'astro_amount': instance.astro_amount,
      'type': instance.type,
      't_type': instance.t_type,
      'astro_description': instance.astro_description,
      'created_at': instance.created_at,
    };
