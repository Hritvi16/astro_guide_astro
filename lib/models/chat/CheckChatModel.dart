import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CheckChatModel.freezed.dart';
part 'CheckChatModel.g.dart';


@freezed
class CheckChatModel with _$CheckChatModel {
  factory CheckChatModel({
    required String name,
    required String mobile,
    required String gender,
    required String dob,
    int? ci_id,
    String? marital_status,
    String? type,
    required String info,
  }) = _CheckChatModel;

  factory CheckChatModel.fromJson(JSON json) => _$CheckChatModelFromJson(json);
}

