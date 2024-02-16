import 'package:astro_guide_astro/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VimMahaDashaDateModel.freezed.dart';
part 'VimMahaDashaDateModel.g.dart';


@freezed
class VimMahaDashaDateModel with _$VimMahaDashaDateModel {
  factory VimMahaDashaDateModel({
  required String start_date,
  required String end_date,
  }) = _VimMahaDashaDateModel;

  factory VimMahaDashaDateModel.fromJson(JSON json) => _$VimMahaDashaDateModelFromJson(json);
}
