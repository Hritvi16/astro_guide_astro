import 'package:astro_guide_astro/models/spec/SpecListModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/repositories/SpecRepository.dart';

class SpecProvider {
  final SpecRepository specRepository;

  SpecProvider(this.specRepository);

  Future<SpecListModel> fetch(String token, String endpoint) async {
    var specListResponse = await specRepository.fetch(token, endpoint);

    return SpecListModel.fromJson(specListResponse);
  }

}
