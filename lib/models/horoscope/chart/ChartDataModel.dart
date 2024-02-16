import 'package:astro_guide_astro/models/horoscope/chart/PlanetModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChartDataModel.freezed.dart';
part 'ChartDataModel.g.dart';


@freezed
class ChartDataModel with _$ChartDataModel {
  factory ChartDataModel({
  required dynamic sign_no,
  required List<PlanetModel> planet,
  }) = _ChartDataModel;

  factory ChartDataModel.fromJson(JSON json) => _$ChartDataModelFromJson(json);
}
