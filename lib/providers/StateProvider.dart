import 'package:astro_guide_astro/models/state/StateListModel.dart';
import 'package:astro_guide_astro/repositories/StateRepository.dart';

class StateProvider {
  final StateRepository stateRepository;

  StateProvider(this.stateRepository);

  Future<StateListModel> fetchList(Map<String, dynamic> data, String endpoint, String token) async {
    var stateListResponse = await stateRepository.getStates(data, endpoint, token);

    return StateListModel.fromJson(stateListResponse);
  }

}
