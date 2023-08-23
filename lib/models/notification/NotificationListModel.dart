import 'package:astro_guide_astro/models/notification/NotificationModel.dart';
import 'package:astro_guide_astro/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NotificationListModel.freezed.dart';
part 'NotificationListModel.g.dart';

@freezed
class NotificationListModel with _$NotificationListModel {
  factory NotificationListModel.fromJson(JSON json) => _$NotificationListModelFromJson(json);

  factory NotificationListModel({
    required String status,
    required int code,
    required String message,
    required List<NotificationModel> notifications,
  }) = _NotificationListModel;
}
