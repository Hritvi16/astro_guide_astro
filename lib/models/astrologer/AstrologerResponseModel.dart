import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerResponseModel.freezed.dart';
part 'AstrologerResponseModel.g.dart';


@freezed
class AstrologerResponseModel with _$AstrologerResponseModel {
  factory AstrologerResponseModel({
    required String status,
    required int code,
    required String message,
    AstrologerModel? data,
    List<CityModel>? cities,
    List<LanguageModel>? languages,
    List<SpecModel>? specifications,
    List<TypeModel>? types,
  }) = _AstrologerResponseModel;

  factory AstrologerResponseModel.fromJson(JSON json) => _$AstrologerResponseModelFromJson(json);
}

