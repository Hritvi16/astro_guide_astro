import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/models/country/CountryModel.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ValuesModel.freezed.dart';
part 'ValuesModel.g.dart';


@freezed
class ValuesModel with _$ValuesModel {
  factory ValuesModel({
    required String status,
    required int code,
    required String message,
    List<CountryModel>? countries,
    List<CityModel>? cities,
    List<TypeModel>? types,
    List<SpecModel>? specifications,
    List<LanguageModel>? languages,
  }) = _ValuesModel;

  factory ValuesModel.fromJson(JSON json) => _$ValuesModelFromJson(json);
}

