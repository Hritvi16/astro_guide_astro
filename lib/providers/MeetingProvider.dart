import 'package:astro_guide_astro/models/meeting/CreateModel.dart';
import 'package:astro_guide_astro/models/meeting/SessionModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/session/SessionMissedModel.dart';
import 'package:astro_guide_astro/models/session/SessionResponseModel.dart';
import 'package:astro_guide_astro/repositories/MeetingRepository.dart';

class MeetingProvider {
  final MeetingRepository meetingRepository;

  MeetingProvider(this.meetingRepository);


  Future<SessionResponseModel> fetchByID(String token, String endpoint, Map<String, dynamic> body) async {
    var sessionResponseModel = await meetingRepository.fetchByID(token, endpoint, body);

    return SessionResponseModel.fromJson(sessionResponseModel);
  }

  Future<CreateModel> validate(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.validate(data, token);

    return CreateModel.fromJson(response);
  }

  Future<SessionModel> end(Map<String, dynamic> data, String token) async {
    var sessionResponse = await meetingRepository.end(data, token);

    return SessionModel.fromJson(sessionResponse);
  }

  Future<ResponseModel> waitlist(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.waitlist(data, token);

    return ResponseModel.fromJson(response);
  }

  Future<ResponseModel> cancel(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.cancel(data, token);

    return ResponseModel.fromJson(response);
  }

  Future<ResponseModel> reject(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.reject(data, token);

    return ResponseModel.fromJson(response);
  }

  Future<SessionMissedModel> reconnect(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await meetingRepository.fetchByID(token, endpoint, body);

    return SessionMissedModel.fromJson(response);
  }

}
