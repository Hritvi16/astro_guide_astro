import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';

class SpecRepository {
  final ApiService apiService;

  SpecRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var countries = await apiService.get(endpoint: ApiConstants.specAPI+endpoint, token: token);
    return countries;
  }

}
