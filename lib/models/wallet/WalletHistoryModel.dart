import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'WalletHistoryModel.freezed.dart';
part 'WalletHistoryModel.g.dart';


@freezed
class WalletHistoryModel with _$WalletHistoryModel {
  factory WalletHistoryModel({
    required int id,
    required String order_id,
    int? p_id,
    required double amount,
    required double astro_amount,
    required String type,
    required String t_type,
    required String astro_description,
    required String created_at,
  }) = _WalletHistoryModel;

  factory WalletHistoryModel.fromJson(JSON json) => _$WalletHistoryModelFromJson(json);
}

