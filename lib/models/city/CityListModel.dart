import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CityListModel.freezed.dart';
part 'CityListModel.g.dart';


@freezed
class CityListModel with _$CityListModel {
  factory CityListModel({
    required String status,
    required int code,
    required String message,
    required List<CityModel> data,
  }) = _CityListModel;

  factory CityListModel.fromJson(JSON json) => _$CityListModelFromJson(json);
}

