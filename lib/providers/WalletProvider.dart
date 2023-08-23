
import 'package:astro_guide_astro/models/response/ResponseModel.dart';
import 'package:astro_guide_astro/models/wallet/WalletResponseModel.dart';
import 'package:astro_guide_astro/repositories/WalletRepository.dart';

class WalletProvider {
  final WalletRepository walletRepository;

  WalletProvider(this.walletRepository);

  Future<WalletResponseModel> fetch(String token, String endpoint) async {
    var walletResponseResponse = await walletRepository.fetch(token, endpoint);

    return WalletResponseModel.fromJson(walletResponseResponse);
  }

  Future<ResponseModel> transaction(Map<String, dynamic> data, String endpoint, String token) async {
    var response = await walletRepository.transaction(data, endpoint, token);

    return ResponseModel.fromJson(response);
  }
}
