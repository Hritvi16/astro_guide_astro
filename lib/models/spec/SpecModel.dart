import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SpecModel.freezed.dart';
part 'SpecModel.g.dart';


@freezed
class SpecModel with _$SpecModel {
  factory SpecModel({
    required int id,
    required String spec,
    String? icon,
    bool? load

  }) = _SpecModel;

  factory SpecModel.fromJson(JSON json) => _$SpecModelFromJson(json);
}
