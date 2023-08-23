import 'package:astro_guide_astro/models/bank/BankModel.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerBankModel.freezed.dart';
part 'AstrologerBankModel.g.dart';


@freezed
class AstrologerBankModel with _$AstrologerBankModel {
  factory AstrologerBankModel({
    required String status,
    required int code,
    required String message,
    BankModel? data,
    List<BankModel>? history,
  }) = _AstrologerBankModel;

  factory AstrologerBankModel.fromJson(JSON json) => _$AstrologerBankModelFromJson(json);
}

