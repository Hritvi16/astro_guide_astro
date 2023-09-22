import 'package:astro_guide_astro/models/setting/SettingResponseModel.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class AstrologerRepository {
  final ApiService apiService;

  AstrologerRepository(this.apiService);

  Future<JSON> login(Map<String, dynamic> data, String token, String endpoint) async {
    var login = await apiService.post(endpoint: ApiConstants.astrologerAPI+endpoint, body: data, token: token);

    print(login);
    return login;
  }


  Future<JSON> settings(String token, String endpoint) async {
    var response = await apiService.get(endpoint: ApiConstants.astrologerAPI+endpoint, token: token);

    return response;
  }

  Future<JSON> fetch(String token, String endpoint) async {
    var astrologers = await apiService.get(endpoint: ApiConstants.astrologerAPI+endpoint, token: token);
    return astrologers;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var astrologers = await apiService.post(endpoint: ApiConstants.astrologerAPI+endpoint, token: token, body: data);
    return astrologers;
  }

  Future<JSON> add(FormData formData, String endpoint, String token) async {
    var image = await apiService.file(endpoint: ApiConstants.astrologerAPI+endpoint, body: formData, token: token);

    return image;
  }

  Future<JSON> update(FormData formData, String endpoint, String token) async {
    var image = await apiService.file(endpoint: ApiConstants.astrologerAPI+endpoint, body: formData, token: token);

    return image;
  }

  Future<JSON> updateStatus(String token, String endpoint, Map<String, dynamic> data) async {
    var response = await apiService.post(endpoint: ApiConstants.astrologerAPI+endpoint, token: token, body: data);
    return response;
  }
}
