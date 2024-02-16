// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AshtakootModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AshtakootModelImpl _$$AshtakootModelImplFromJson(Map<String, dynamic> json) =>
    _$AshtakootModelImpl(
      ashtakoot_milan: (json['ashtakoot_milan'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, AshtakootMilanModel.fromJson(e as Map<String, dynamic>)),
      ),
      ashtakoot_milan_result: AshtakootMilanResultModel.fromJson(
          json['ashtakoot_milan_result'] as Map<String, dynamic>),
      manglik_dosha: ManglikDoshaModel.fromJson(
          json['manglik_dosha'] as Map<String, dynamic>),
      nadi_dosha: json['nadi_dosha'] as String,
      bhakoot_dosha: json['bhakoot_dosha'] as String,
    );

Map<String, dynamic> _$$AshtakootModelImplToJson(
        _$AshtakootModelImpl instance) =>
    <String, dynamic>{
      'ashtakoot_milan': instance.ashtakoot_milan,
      'ashtakoot_milan_result': instance.ashtakoot_milan_result,
      'manglik_dosha': instance.manglik_dosha,
      'nadi_dosha': instance.nadi_dosha,
      'bhakoot_dosha': instance.bhakoot_dosha,
    };
