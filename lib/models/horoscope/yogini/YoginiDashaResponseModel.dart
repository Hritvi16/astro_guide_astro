import 'package:astro_guide_astro/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'YoginiDashaResponseModel.freezed.dart';
part 'YoginiDashaResponseModel.g.dart';


@freezed
class YoginiDashaResponseModel with _$YoginiDashaResponseModel {
  factory YoginiDashaResponseModel({
    required String status,
    required int code,
    required String message,
    YoginiDashaModel? data,
  }) = _YoginiDashaResponseModel;

  factory YoginiDashaResponseModel.fromJson(JSON json) => _$YoginiDashaResponseModelFromJson(json);
}

