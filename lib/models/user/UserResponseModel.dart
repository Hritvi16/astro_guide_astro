import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'UserResponseModel.freezed.dart';
part 'UserResponseModel.g.dart';


@freezed
class UserResponseModel with _$UserResponseModel {
  factory UserResponseModel({
    required String status,
    required int code,
    required String message,
    UserModel? data,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(JSON json) => _$UserResponseModelFromJson(json);
}

