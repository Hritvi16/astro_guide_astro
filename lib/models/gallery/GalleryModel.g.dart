// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryModelImpl _$$GalleryModelImplFromJson(Map<String, dynamic> json) =>
    _$GalleryModelImpl(
      id: json['id'] as int,
      astro_id: json['astro_id'] as int,
      image: json['image'] as String,
      reason: json['reason'] as String?,
      status: json['status'] as int,
      approved: json['approved'] as int,
      created_at: json['created_at'] as String,
      approved_at: json['approved_at'] as String?,
      load: json['load'] as bool?,
    );

Map<String, dynamic> _$$GalleryModelImplToJson(_$GalleryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'astro_id': instance.astro_id,
      'image': instance.image,
      'reason': instance.reason,
      'status': instance.status,
      'approved': instance.approved,
      'created_at': instance.created_at,
      'approved_at': instance.approved_at,
      'load': instance.load,
    };
