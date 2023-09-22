// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletResponseModel _$$_WalletResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_WalletResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      data: json['data'] == null
          ? null
          : WalletModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WalletResponseModelToJson(
        _$_WalletResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'amount': instance.amount,
      'data': instance.data,
    };
