import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerTypeModel.freezed.dart';
part 'AstrologerTypeModel.g.dart';


@freezed
class AstrologerTypeModel with _$AstrologerTypeModel {
  factory AstrologerTypeModel({
    required String status,
    required int code,
    required String message,
    List<TypeModel>? data,
    List<TypeModel>? types,
  }) = _AstrologerTypeModel;

  factory AstrologerTypeModel.fromJson(JSON json) => _$AstrologerTypeModelFromJson(json);
}

