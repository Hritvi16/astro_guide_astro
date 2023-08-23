// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankModel _$$_BankModelFromJson(Map<String, dynamic> json) => _$_BankModel(
      id: json['id'] as int,
      astro_id: json['astro_id'] as int,
      bank_name: json['bank_name'] as String,
      branch: json['branch'] as String,
      holder_name: json['holder_name'] as String,
      account_no: json['account_no'] as String,
      ifsc: json['ifsc'] as String,
      cheque: json['cheque'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      verified_at: json['verified_at'] as String?,
      verified_by: json['verified_by'] as int?,
      verified: json['verified'] as int,
      status: json['status'] as int,
    );

Map<String, dynamic> _$$_BankModelToJson(_$_BankModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'astro_id': instance.astro_id,
      'bank_name': instance.bank_name,
      'branch': instance.branch,
      'holder_name': instance.holder_name,
      'account_no': instance.account_no,
      'ifsc': instance.ifsc,
      'cheque': instance.cheque,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'verified_at': instance.verified_at,
      'verified_by': instance.verified_by,
      'verified': instance.verified,
      'status': instance.status,
    };
