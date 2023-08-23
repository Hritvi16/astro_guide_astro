import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerSpecModel.freezed.dart';
part 'AstrologerSpecModel.g.dart';


@freezed
class AstrologerSpecModel with _$AstrologerSpecModel {
  factory AstrologerSpecModel({
    required String status,
    required int code,
    required String message,
    List<SpecModel>? data,
    List<SpecModel>? specs,
  }) = _AstrologerSpecModel;

  factory AstrologerSpecModel.fromJson(JSON json) => _$AstrologerSpecModelFromJson(json);
}

