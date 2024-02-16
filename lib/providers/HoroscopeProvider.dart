import 'package:astro_guide_astro/models/horoscope/ashtakoot/AshtakootResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/basic/BasicKundliResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/chart/ChartResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/horoscope/HoroscopeResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/kp/KPPlanetResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/planet/PlanetResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/vimshottari/VimshottariDashaResponseModel.dart';
import 'package:astro_guide_astro/models/horoscope/yogini/YoginiDashaResponseModel.dart';
import 'package:astro_guide_astro/repositories/HoroscopeRepository.dart';

class HoroscopeProvider {
  final HoroscopeRepository horoscopeRepository;

  HoroscopeProvider(this.horoscopeRepository);

  Future<BasicKundliResponseModel> fetchBasicKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var basicKundliResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return BasicKundliResponseModel.fromJson(basicKundliResponseModel);
  }

  Future<ChartResponseModel> fetchCharts(String token, String endpoint, Map<String, dynamic> data) async {
    var chartResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return ChartResponseModel.fromJson(chartResponseModel);
  }

  Future<PlanetResponseModel> fetchPlanetKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var planetResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return PlanetResponseModel.fromJson(planetResponseModel);
  }

  Future<KPPlanetResponseModel> fetchKPPlanetKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var kPPlanetResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return KPPlanetResponseModel.fromJson(kPPlanetResponseModel);
  }

  Future<VimshottariDashaResponseModel> fetchVimshottariDasha(String token, String endpoint, Map<String, dynamic> data) async {
    var vimshottariDashaResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return VimshottariDashaResponseModel.fromJson(vimshottariDashaResponseModel);
  }

  Future<YoginiDashaResponseModel> fetchYoginiDasha(String token, String endpoint, Map<String, dynamic> data) async {
    var yoginiDashaResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return YoginiDashaResponseModel.fromJson(yoginiDashaResponseModel);
  }
}
