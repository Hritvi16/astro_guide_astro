import 'package:astro_guide_astro/models/astrologer/AstrologerBankModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerGalleryModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerLanguageModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerListModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerResponseModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerSpecModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerTypeModel.dart';
import 'package:astro_guide_astro/models/login/LoginModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/review/ReviewListModel.dart';
import 'package:astro_guide_astro/models/setting/SettingResponseModel.dart';
import 'package:astro_guide_astro/models/values/ValuesModel.dart';
import 'package:astro_guide_astro/repositories/AstrologerRepository.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';

class AstrologerProvider {
  final AstrologerRepository astrologerRepository;

  AstrologerProvider(this.astrologerRepository);

  Future<LoginModel> login(Map<String, dynamic> data, String token, String endpoint) async {
    var loginResponse = await astrologerRepository.login(data, token, endpoint);

    return LoginModel.fromJson(loginResponse);
  }

  Future<LoginModel> check(String token, String endpoint) async {
    var loginResponse = await astrologerRepository.check(token, endpoint);

    return LoginModel.fromJson(loginResponse);
  }

  Future<SettingResponseModel> settings(String token, String endpoint) async {
    var settingResponseModel = await astrologerRepository.settings(token, endpoint);

    return SettingResponseModel.fromJson(settingResponseModel);
  }

  Future<AstrologerListModel> fetch(String token, String endpoint) async {
    var astrologerListResponse = await astrologerRepository.fetch(token, endpoint);

    return AstrologerListModel.fromJson(astrologerListResponse);
  }

  Future<AstrologerListModel> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var astrologerListResponse = await astrologerRepository.fetchByID(token, endpoint, data);

    return AstrologerListModel.fromJson(astrologerListResponse);
  }

  Future<LoginModel> add(String token, String endpoint, FormData formData) async {
    var loginResponse = await astrologerRepository.add(formData, endpoint, token);

    return LoginModel.fromJson(loginResponse);
  }

  Future<ResponseModel> update(FormData formData, String endpoint, String token) async {
    var loginResponse = await astrologerRepository.update(formData, endpoint, token);

    return ResponseModel.fromJson(loginResponse);
  }

  Future<AstrologerResponseModel> fetchSingle(String token, String endpoint) async {
    var astrologerResponseModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerResponseModel.fromJson(astrologerResponseModel);
  }

  Future<AstrologerBankModel> fetchBank(String token, String endpoint) async {
    var astrologerBankeModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerBankModel.fromJson(astrologerBankeModel);
  }

  Future<ValuesModel> fetchValues(String token, String endpoint) async {
    var valuesModel = await astrologerRepository.fetch(token, endpoint);

    return ValuesModel.fromJson(valuesModel);
  }

  Future<AstrologerLanguageModel> fetchLanguages(String token, String endpoint) async {
    var languageModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerLanguageModel.fromJson(languageModel);
  }

  Future<AstrologerTypeModel> fetchTypes(String token, String endpoint) async {
    var typeModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerTypeModel.fromJson(typeModel);
  }

  Future<AstrologerSpecModel> fetchSpecs(String token, String endpoint) async {
    var specModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerSpecModel.fromJson(specModel);
  }

  Future<ResponseModel> updateStatus(String token, String endpoint, Map<String, dynamic> data) async {
    var response = await astrologerRepository.updateStatus(token, endpoint, data);

    print(response);

    return ResponseModel.fromJson(response);
  }

  Future<ReviewListModel> fetchReviews(String token, String endpoint) async {
    var reviewListModel = await astrologerRepository.fetch(token, endpoint);

    return ReviewListModel.fromJson(reviewListModel);
  }


  Future<AstrologerGalleryModel> fetchGallery(String token, String endpoint) async {
    var galleryModel = await astrologerRepository.fetch(token, endpoint);

    return AstrologerGalleryModel.fromJson(galleryModel);
  }

  Future<ResponseModel> delete(String token, String endpoint) async {
    var responseModel = await astrologerRepository.fetch(token, endpoint);

    return ResponseModel.fromJson(responseModel);
  }

}
