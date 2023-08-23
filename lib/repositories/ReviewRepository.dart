import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';

class ReviewRepository {
  final ApiService apiService;

  ReviewRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var reviews = await apiService.get(endpoint: ApiConstants.reviewAPI+endpoint, token: token);
    return reviews;
  }

  // Future<JSON> fetchByID(String token, String endpoint, Map<String, dynamic> data) async {
  //   var reviews = await apiService.post(endpoint: ApiConstants.reviewAPI+endpoint, body: data, token: token);
  //   return reviews;
  // }

}
