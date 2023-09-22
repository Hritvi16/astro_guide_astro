import 'package:astro_guide_astro/models/quickReplies/QuickRepliesModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuickRepliesListModel.freezed.dart';
part 'QuickRepliesListModel.g.dart';


@freezed
class QuickRepliesListModel with _$QuickRepliesListModel {
  factory QuickRepliesListModel({
    required String status,
    required int code,
    required String message,
    List<QuickRepliesModel>? data,
  }) = _QuickRepliesListModel;

  factory QuickRepliesListModel.fromJson(JSON json) => _$QuickRepliesListModelFromJson(json);
}

