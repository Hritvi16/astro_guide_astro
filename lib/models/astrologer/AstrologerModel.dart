import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerModel.freezed.dart';
part 'AstrologerModel.g.dart';


@freezed
class AstrologerModel with _$AstrologerModel {
  factory AstrologerModel({
    required int id,
    required String name,
    required String mobile,
    required String email,
    required String gender,
    required String dob,
    required String experience,
    required String profile,
    required String about,
    int? fav,
    int? follow,
    int? ci_id,
    double? p_chat,
    double? p_call,
    double? f_chat,
    double? f_call,
    double? p_commission,
    double? f_commission,
  }) = _AstrologerModel;

  factory AstrologerModel.fromJson(JSON json) => _$AstrologerModelFromJson(json);
}
