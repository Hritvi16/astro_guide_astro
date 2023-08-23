// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerGalleryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerGalleryModel _$$_AstrologerGalleryModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerGalleryModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerGalleryModelToJson(
        _$_AstrologerGalleryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
