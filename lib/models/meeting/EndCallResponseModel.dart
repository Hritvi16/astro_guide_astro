import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'EndCallResponseModel.freezed.dart';
part 'EndCallResponseModel.g.dart';


@freezed
class EndCallResponseModel with _$EndCallResponseModel {
  factory EndCallResponseModel({
    required String status,
    required int code,
    required String message,
    String? category
  }) = _EndCallResponseModel;

  factory EndCallResponseModel.fromJson(JSON json) => _$EndCallResponseModelFromJson(json);
}

