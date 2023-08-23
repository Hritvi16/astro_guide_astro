import 'package:astro_guide_astro/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide_astro/models/blog/BlogModel.dart';
import 'package:astro_guide_astro/models/report/ReportModel.dart';
import 'package:astro_guide_astro/models/spec/SpecModel.dart';
import 'package:astro_guide_astro/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide_astro/models/video/VideoModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide_astro/models/banner/BannerModel.dart';

part 'DashboardModel.freezed.dart';
part 'DashboardModel.g.dart';


@freezed
class DashboardModel with _$DashboardModel {
  factory DashboardModel({
    required String status,
    required int code,
    required String message,
    ReportModel? data,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(JSON json) => _$DashboardModelFromJson(json);
}

