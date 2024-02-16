import 'package:astro_guide_astro/models/horoscope/vimshottari/VimMahaDashaModel.dart';
import 'package:astro_guide_astro/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VimshottariDashaModel.freezed.dart';
part 'VimshottariDashaModel.g.dart';


@freezed
class VimshottariDashaModel with _$VimshottariDashaModel {
  factory VimshottariDashaModel({
  required String date,
  required String time,
  required VimMahaDashaModel maha_dasha,
  }) = _VimshottariDashaModel;

  factory VimshottariDashaModel.fromJson(JSON json) => _$VimshottariDashaModelFromJson(json);
}
