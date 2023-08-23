import 'package:astro_guide_astro/models/review/ReviewModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReviewListModel.freezed.dart';
part 'ReviewListModel.g.dart';


@freezed
class ReviewListModel with _$ReviewListModel {
  factory ReviewListModel({
    required String status,
    required int code,
    required String message,
    List<ReviewModel>? data,
  }) = _ReviewListModel;

  factory ReviewListModel.fromJson(JSON json) => _$ReviewListModelFromJson(json);
}

