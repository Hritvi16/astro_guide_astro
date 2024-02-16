// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BasicKundliModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasicKundliModelImpl _$$BasicKundliModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BasicKundliModelImpl(
      full_name: json['full_name'] as String,
      date: json['date'] as String,
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      hour: json['hour'] as String,
      minute: json['minute'] as String,
      gender: json['gender'] as String,
      place: json['place'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      timezone: json['timezone'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      tithi: json['tithi'] as String,
      paksha: json['paksha'] as String,
      paya: PayaModel.fromJson(json['paya'] as Map<String, dynamic>),
      sunsign: json['sunsign'] as String,
      moonsign: json['moonsign'] as String,
      rashi_akshar: json['rashi_akshar'] as String,
      chandramasa: json['chandramasa'] as String,
      tatva: json['tatva'] as String,
      prahar: json['prahar'] as int,
      nakshatra: json['nakshatra'] as String,
      vaar: json['vaar'] as String,
      varna: json['varna'] as String,
      vashya: json['vashya'] as String,
      yoni: json['yoni'] as String,
      gana: json['gana'] as String,
      nadi: json['nadi'] as String,
    );

Map<String, dynamic> _$$BasicKundliModelImplToJson(
        _$BasicKundliModelImpl instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'date': instance.date,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
      'gender': instance.gender,
      'place': instance.place,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'tithi': instance.tithi,
      'paksha': instance.paksha,
      'paya': instance.paya,
      'sunsign': instance.sunsign,
      'moonsign': instance.moonsign,
      'rashi_akshar': instance.rashi_akshar,
      'chandramasa': instance.chandramasa,
      'tatva': instance.tatva,
      'prahar': instance.prahar,
      'nakshatra': instance.nakshatra,
      'vaar': instance.vaar,
      'varna': instance.varna,
      'vashya': instance.vashya,
      'yoni': instance.yoni,
      'gana': instance.gana,
      'nadi': instance.nadi,
    };
