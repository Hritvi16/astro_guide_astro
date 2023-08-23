import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerListModel.freezed.dart';
part 'AstrologerListModel.g.dart';


@freezed
class AstrologerListModel with _$AstrologerListModel {
  factory AstrologerListModel({
    required String status,
    required int code,
    required String message,
    List<AstrologerModel>? data,
  }) = _AstrologerListModel;

  factory AstrologerListModel.fromJson(JSON json) => _$AstrologerListModelFromJson(json);
}

