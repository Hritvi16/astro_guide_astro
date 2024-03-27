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
      p_chat: (json['p_chat'] as num?)?.toDouble(),
      p_call: (json['p_call'] as num?)?.toDouble(),
      f_chat: (json['f_chat'] as num?)?.toDouble(),
      f_call: (json['f_call'] as num?)?.toDouble(),
      p_commission: (json['p_commission'] as num?)?.toDouble(),
      f_commission: (json['f_commission'] as num?)?.toDouble(),
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
      'p_chat': instance.p_chat,
      'p_call': instance.p_call,
      'f_chat': instance.f_chat,
      'f_call': instance.f_call,
      'p_commission': instance.p_commission,
      'f_commission': instance.f_commission,
    };
