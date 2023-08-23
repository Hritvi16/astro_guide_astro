import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'GalleryModel.freezed.dart';
part 'GalleryModel.g.dart';


@freezed
class GalleryModel with _$GalleryModel {
  factory GalleryModel({
    required int id,
    required int astro_id,
    required String image,
    String? reason,
    required int status,
    required int approved,
    required String created_at,
    String? approved_at,
    bool? load

  }) = _GalleryModel;

  factory GalleryModel.fromJson(JSON json) => _$GalleryModelFromJson(json);
}
