import 'package:astro_guide_astro/models/Type/TypeListModel.dart';
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/Type/TypeModel.dart';
import 'package:astro_guide_astro/repositories/TypeRepository.dart';

class TypeProvider {
  final TypeRepository typeRepository;

  TypeProvider(this.typeRepository);

  Future<TypeListModel> fetch(String token, String endpoint) async {
    var typeListResponse = await typeRepository.fetch(token, endpoint);

    return TypeListModel.fromJson(typeListResponse);
  }

}
