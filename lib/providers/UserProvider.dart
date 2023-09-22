import 'package:astro_guide_astro/models/user/UserListModel.dart';
import 'package:astro_guide_astro/models/user/UserResponseModel.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide_astro/models/login/LoginModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/repositories/UserRepository.dart';

class UserProvider {
  final UserRepository userRepository;

  UserProvider(this.userRepository);


  Future<ResponseModel> update(Map<String, dynamic> data, String token) async {
    var response = await userRepository.update(data, token);

    return ResponseModel.fromJson(response);
  }

  Future<UserListModel> fetchByType(String token, String endpoint) async {
    var userListResponse = await userRepository.fetchByID(token, endpoint);

    return UserListModel.fromJson(userListResponse);
  }

  Future<UserResponseModel> fetchByID(String token, String endpoint) async {
    var userResponseModel = await userRepository.fetchByID(token, endpoint);

    return UserResponseModel.fromJson(userResponseModel);
  }

}
