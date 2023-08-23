import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BankModel.freezed.dart';
part 'BankModel.g.dart';


@freezed
class BankModel with _$BankModel {
  factory BankModel({
    required int id,
    required int astro_id,
    required String bank_name,
    required String branch,
    required String holder_name,
    required String account_no,
    required String ifsc,
    required String cheque,
    required String created_at,
    String? updated_at,
    String? verified_at,
    int? verified_by,
    required int verified,
    required int status,
  }) = _BankModel;

  factory BankModel.fromJson(JSON json) => _$BankModelFromJson(json);
}
