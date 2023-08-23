import 'package:astro_guide_astro/models/City/CityListModel.dart';
import 'package:astro_guide_astro/repositories/CityRepository.dart';

class CityProvider {
  final CityRepository cityRepository;

  CityProvider(this.cityRepository);

  Future<CityListModel> fetchList(Map<String, dynamic> data, String endpoint, String token) async {
    var cityListResponse = await cityRepository.getCities(data, endpoint, token);

    return CityListModel.fromJson(cityListResponse);
  }

}
