import 'package:astro_guide_astro/models/type/TypeModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TypeListModel.freezed.dart';
part 'TypeListModel.g.dart';


@freezed
class TypeListModel with _$TypeListModel {
  factory TypeListModel({
    required String status,
    required int code,
    required String message,
    List<TypeModel>? data,
  }) = _TypeListModel;

  factory TypeListModel.fromJson(JSON json) => _$TypeListModelFromJson(json);
}

