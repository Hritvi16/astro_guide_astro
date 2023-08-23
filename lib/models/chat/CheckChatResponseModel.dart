import 'package:astro_guide_astro/models/chat/CheckChatModel.dart';
import 'package:astro_guide_astro/models/city/CityModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CheckChatResponseModel.freezed.dart';
part 'CheckChatResponseModel.g.dart';


@freezed
class CheckChatResponseModel with _$CheckChatResponseModel {
  factory CheckChatResponseModel({
    required String status,
    required int code,
    required String message,
    CheckChatModel? data,
    List<CityModel>? cities,
    String? started_at,
    int? rate,
    String? type,
    double? wallet,
  }) = _CheckChatResponseModel;

  factory CheckChatResponseModel.fromJson(JSON json) => _$CheckChatResponseModelFromJson(json);
}

