import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'UserListModel.freezed.dart';
part 'UserListModel.g.dart';


@freezed
class UserListModel with _$UserListModel {
  factory UserListModel({
    required String status,
    required int code,
    required String message,
    List<UserModel>? data,
  }) = _UserListModel;

  factory UserListModel.fromJson(JSON json) => _$UserListModelFromJson(json);
}

