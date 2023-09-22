import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'QuickRepliesModel.freezed.dart';
part 'QuickRepliesModel.g.dart';


@freezed
class QuickRepliesModel with _$QuickRepliesModel {
  factory QuickRepliesModel({
    required int id,
    required int astro_id,
    required String reply,
    required String created_at,
    String? updated_at,
    required int status,
    bool? load

  }) = _QuickRepliesModel;

  factory QuickRepliesModel.fromJson(JSON json) => _$QuickRepliesModelFromJson(json);
}
