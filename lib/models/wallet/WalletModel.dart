import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'WalletModel.freezed.dart';
part 'WalletModel.g.dart';


@freezed
class WalletModel with _$WalletModel {
  factory WalletModel({
    required double amount,
    required double total,
    required double earnings,
    required double paid,
    required double yearly_amount,
    required double monthly_amount,
    required double today_amount,
    required double yearly_earning,
    required double monthly_earning,
    required double today_earning,
  }) = _WalletModel;

  factory WalletModel.fromJson(JSON json) => _$WalletModelFromJson(json);
}

