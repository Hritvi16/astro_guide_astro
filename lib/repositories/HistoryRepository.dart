import 'package:astro_guide_astro/services/networking/ApiConstants.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:astro_guide_astro/services/networking/ApiService.dart';

class HistoryRepository {
  final ApiService apiService;

  HistoryRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var history = await apiService.get(endpoint: ApiConstants.transactionAPI+endpoint, token: token);
    return history;
  }
}
