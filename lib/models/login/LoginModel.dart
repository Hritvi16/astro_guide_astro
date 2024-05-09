import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginModel.freezed.dart';
part 'LoginModel.g.dart';

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    required int code,
    required String status,
    required String message,
    String? whatsapp_url,
    String? access_token,
    String? refresh_token,
    int? whatsapp,
  }) = _LoginModel;

  factory LoginModel.fromJson(JSON json) => _$LoginModelFromJson(json);
}
