import 'package:astro_guide_astro/models/package/PackageListModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/package/PackageModel.dart';
import 'package:astro_guide_astro/repositories/PackageRepository.dart';

class PackageProvider {
  final PackageRepository packageRepository;

  PackageProvider(this.packageRepository);

  Future<PackageListModel> fetch(String token, String endpoint) async {
    var packageListResponse = await packageRepository.fetch(token, endpoint);

    return PackageListModel.fromJson(packageListResponse);
  }

}
