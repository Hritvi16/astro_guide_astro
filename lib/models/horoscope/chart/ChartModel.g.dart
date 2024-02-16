// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChartModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChartModelImpl _$$ChartModelImplFromJson(Map<String, dynamic> json) =>
    _$ChartModelImpl(
      svg: json['svg'] as String,
      base64_image: json['base64_image'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ChartDataModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$ChartModelImplToJson(_$ChartModelImpl instance) =>
    <String, dynamic>{
      'svg': instance.svg,
      'base64_image': instance.base64_image,
      'data': instance.data,
    };
