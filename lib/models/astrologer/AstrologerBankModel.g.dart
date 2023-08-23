// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerBankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerBankModel _$$_AstrologerBankModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerBankModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : BankModel.fromJson(json['data'] as Map<String, dynamic>),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerBankModelToJson(
        _$_AstrologerBankModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'history': instance.history,
    };
