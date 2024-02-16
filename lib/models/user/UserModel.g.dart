// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      profile: json['profile'] as String?,
      mobile: json['mobile'] as String?,
      gender: json['gender'] as String?,
      nationality: json['nationality'] as int?,
      nationality_name: json['nationality_name'] as String?,
      nationality_icon: json['nationality_icon'] as String?,
      ci_id: json['ci_id'] as int?,
      country: json['country'] as String?,
      country_icon: json['country_icon'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile': instance.profile,
      'mobile': instance.mobile,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'nationality_name': instance.nationality_name,
      'nationality_icon': instance.nationality_icon,
      'ci_id': instance.ci_id,
      'country': instance.country,
      'country_icon': instance.country_icon,
      'state': instance.state,
      'city': instance.city,
    };
