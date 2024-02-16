import 'package:astro_guide_astro/models/horoscope/horoscope/PredictionModel.dart';
import 'package:astro_guide_astro/models/horoscope/horoscope/SpecialModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HoroscopeModel.freezed.dart';
part 'HoroscopeModel.g.dart';


@freezed
class HoroscopeModel with _$HoroscopeModel {
  factory HoroscopeModel({
    required String sign,
    required PredictionModel prediction,
    required SpecialModel special,
  }) = _HoroscopeModel;

  factory HoroscopeModel.fromJson(JSON json) => _$HoroscopeModelFromJson(json);
}
