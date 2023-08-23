import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';

class TypeRepository {
  final ApiService apiService;

  TypeRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var countries = await apiService.get(endpoint: ApiConstants.typeAPI+endpoint, token: token);
    return countries;
  }

}
