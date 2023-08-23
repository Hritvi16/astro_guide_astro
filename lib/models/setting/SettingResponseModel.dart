import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/setting/SettingModel.dart';
import 'package:astro_guide_astro/models/user/UserModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SettingResponseModel.freezed.dart';
part 'SettingResponseModel.g.dart';

@freezed
class SettingResponseModel with _$SettingResponseModel {
  factory SettingResponseModel({
    required String status,
    required int code,
    required String message,
    SettingModel? data,
    AstrologerModel? astrologer
  }) = _SettingResponseModel;

  factory SettingResponseModel.fromJson(JSON json) => _$SettingResponseModelFromJson(json);
}
