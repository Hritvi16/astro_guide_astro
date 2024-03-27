import 'package:astro_guide_astro/models/horoscope/KundliDetailModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KundliResponseModel.freezed.dart';
part 'KundliResponseModel.g.dart';


@freezed
class KundliResponseModel with _$KundliResponseModel {
  factory KundliResponseModel({
    required String status,
    required int code,
    required String message,
    KundliDetailModel? data,
  }) = _KundliResponseModel;

  factory KundliResponseModel.fromJson(JSON json) => _$KundliResponseModelFromJson(json);
}

