import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/language/LanguageModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerLanguageModel.freezed.dart';
part 'AstrologerLanguageModel.g.dart';


@freezed
class AstrologerLanguageModel with _$AstrologerLanguageModel {
  factory AstrologerLanguageModel({
    required String status,
    required int code,
    required String message,
    List<LanguageModel>? data,
    List<LanguageModel>? languages,
  }) = _AstrologerLanguageModel;

  factory AstrologerLanguageModel.fromJson(JSON json) => _$AstrologerLanguageModelFromJson(json);
}

