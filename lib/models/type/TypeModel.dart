import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TypeModel.freezed.dart';
part 'TypeModel.g.dart';


@freezed
class TypeModel with _$TypeModel {
  factory TypeModel({
    required int id,
    required String type,
    String? t_type,
    bool? load
  }) = _TypeModel;

  factory TypeModel.fromJson(JSON json) => _$TypeModelFromJson(json);
}
