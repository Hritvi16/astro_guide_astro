import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/blog/BlogModel.dart';
import 'package:astro_guide_astro/models/chat/ChatHistoryModel.dart';
import 'package:astro_guide_astro/models/session/SessionHistoryModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide_astro/models/video/VideoModel.dart';
import 'package:astro_guide_astro/models/wallet/WalletHistoryModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide_astro/models/banner/BannerModel.dart';

part 'HistoryModel.freezed.dart';
part 'HistoryModel.g.dart';


@freezed
class HistoryModel with _$HistoryModel {
  factory HistoryModel({
    required String status,
    required int code,
    required String message,
    double? amount,
    List<WalletHistoryModel>? wallet,
    List<WalletHistoryModel>? payment,
    List<SessionHistoryModel>? call,
    List<SessionHistoryModel>? chat,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(JSON json) => _$HistoryModelFromJson(json);
}

