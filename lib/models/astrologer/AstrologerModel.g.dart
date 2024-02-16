// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerModelImpl _$$AstrologerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      experience: json['experience'] as String,
      profile: json['profile'] as String,
      about: json['about'] as String,
      fav: json['fav'] as int?,
      follow: json['follow'] as int?,
      ci_id: json['ci_id'] as int?,
    );

Map<String, dynamic> _$$AstrologerModelImplToJson(
        _$AstrologerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'experience': instance.experience,
      'profile': instance.profile,
      'about': instance.about,
      'fav': instance.fav,
      'follow': instance.follow,
      'ci_id': instance.ci_id,
    };
