import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide_astro/models/login/LoginModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/repositories/TokenRepository.dart';

class TokenProvider {
  final TokenRepository tokenRepository;

  TokenProvider(this.tokenRepository);

  Future<LoginModel> access(Map<String, dynamic> data, String token) async {
    var loginResponse = await tokenRepository.access(data, token);

    return LoginModel.fromJson(loginResponse);
  }
}
