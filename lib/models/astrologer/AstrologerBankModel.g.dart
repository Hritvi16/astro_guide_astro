// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerBankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerBankModelImpl _$$AstrologerBankModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerBankModelImpl(
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

Map<String, dynamic> _$$AstrologerBankModelImplToJson(
        _$AstrologerBankModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'history': instance.history,
    };
