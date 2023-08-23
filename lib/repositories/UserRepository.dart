import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<JSON> update(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.userAPI+ApiConstants.update, body: data, token: token);

    return update;
  }


  Future<JSON> fetchByID(String token, String endpoint) async {
    var users = await apiService.get(endpoint: ApiConstants.userAPI+endpoint, token: token);
    return users;
  }
}
