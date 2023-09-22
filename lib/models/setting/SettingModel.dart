import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SettingModel.freezed.dart';
part 'SettingModel.g.dart';

@freezed
class SettingModel with _$SettingModel {
  factory SettingModel({
    required String about_64,
    required String a_privacy64,
    required String a_tc64,
    required String privacy_64,
    required String mobile,
    required String email,
    required String address,
    required String link,
  }) = _SettingModel;

  factory SettingModel.fromJson(JSON json) => _$SettingModelFromJson(json);
}
