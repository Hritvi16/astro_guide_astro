import 'package:astro_guide_astro/models/gallery/GalleryModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerGalleryModel.freezed.dart';
part 'AstrologerGalleryModel.g.dart';


@freezed
class AstrologerGalleryModel with _$AstrologerGalleryModel {
  factory AstrologerGalleryModel({
    required String status,
    required int code,
    required String message,
    List<GalleryModel>? data,
  }) = _AstrologerGalleryModel;

  factory AstrologerGalleryModel.fromJson(JSON json) => _$AstrologerGalleryModelFromJson(json);
}

