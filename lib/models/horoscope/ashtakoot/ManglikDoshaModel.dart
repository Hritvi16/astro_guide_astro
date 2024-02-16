import 'package:astro_guide_astro/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ManglikDoshaModel.freezed.dart';
part 'ManglikDoshaModel.g.dart';


@freezed
class ManglikDoshaModel with _$ManglikDoshaModel {
  factory ManglikDoshaModel({
  required String p1,
  required String p2,
  }) = _ManglikDoshaModel;

  factory ManglikDoshaModel.fromJson(JSON json) => _$ManglikDoshaModelFromJson(json);
}
