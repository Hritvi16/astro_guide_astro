import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';


@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    required String profile,
    String? mobile,
    String? gender,
    int? nationality,
    int? ci_id,
    String? country,
    String? state,
    String? city,
    String? nationality_name,
  }) = _UserModel;

  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
}
