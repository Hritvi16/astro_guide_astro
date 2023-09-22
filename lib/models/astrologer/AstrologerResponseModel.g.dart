// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerResponseModel _$$_AstrologerResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_AstrologerResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AstrologerModel.fromJson(json['data'] as Map<String, dynamic>),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AstrologerResponseModelToJson(
        _$_AstrologerResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'countries': instance.countries,
      'cities': instance.cities,
      'languages': instance.languages,
      'specifications': instance.specifications,
      'types': instance.types,
    };
