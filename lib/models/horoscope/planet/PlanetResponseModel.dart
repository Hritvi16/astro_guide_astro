import 'package:astro_guide_astro/models/horoscope/planet/PlanetTableModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlanetResponseModel.freezed.dart';
part 'PlanetResponseModel.g.dart';


@freezed
class PlanetResponseModel with _$PlanetResponseModel {
  factory PlanetResponseModel({
    required String status,
    required int code,
    required String message,
    PlanetTableModel? data,
  }) = _PlanetResponseModel;

  factory PlanetResponseModel.fromJson(JSON json) => _$PlanetResponseModelFromJson(json);
}

