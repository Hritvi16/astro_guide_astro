import 'package:astro_guide_astro/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide_astro/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide_astro/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide_astro/models/horoscope/planet/PlanetModel.dart';
import 'package:astro_guide_astro/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide_astro/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'StorageKundliModel.freezed.dart';
part 'StorageKundliModel.g.dart';


@freezed
class StorageKundliModel with _$StorageKundliModel {
  factory StorageKundliModel({
    required BasicKundliModel basic,
    required List<PlanetModel> planet,
    required List<KPPlanetModel> kpPlanet,
    required VimshottariDashaModel vimshottari,
    required YoginiDashaModel yogini,
    required Map<String, ChartModel> charts,
  }) = _StorageKundliModel;

  factory StorageKundliModel.fromJson(JSON json) => _$StorageKundliModelFromJson(json);
}
