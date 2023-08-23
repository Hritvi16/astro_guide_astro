import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide_astro/models/video/VideoModel.dart';

part 'VideoListModel.freezed.dart';
part 'VideoListModel.g.dart';


@freezed
class VideoListModel with _$VideoListModel {
  factory VideoListModel({
    required String status,
    required int code,
    required String message,
    List<VideoModel>? data,
  }) = _VideoListModel;

  factory VideoListModel.fromJson(JSON json) => _$VideoListModelFromJson(json);
}

