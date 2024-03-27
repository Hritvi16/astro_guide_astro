// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlanetTableModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanetTableModel _$PlanetTableModelFromJson(Map<String, dynamic> json) {
  return _PlanetTableModel.fromJson(json);
}

/// @nodoc
mixin _$PlanetTableModel {
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  List<PlanetModel> get planets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanetTableModelCopyWith<PlanetTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetTableModelCopyWith<$Res> {
  factory $PlanetTableModelCopyWith(
          PlanetTableModel value, $Res Function(PlanetTableModel) then) =
      _$PlanetTableModelCopyWithImpl<$Res, PlanetTableModel>;
  @useResult
  $Res call(
      {String date,
      String time,
      String latitude,
      String longitude,
      String timezone,
      List<PlanetModel> planets});
}

/// @nodoc
class _$PlanetTableModelCopyWithImpl<$Res, $Val extends PlanetTableModel>
    implements $PlanetTableModelCopyWith<$Res> {
  _$PlanetTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? time = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timezone = null,
    Object? planets = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      planets: null == planets
          ? _value.planets
          : planets // ignore: cast_nullable_to_non_nullable
              as List<PlanetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanetTableModelImplCopyWith<$Res>
    implements $PlanetTableModelCopyWith<$Res> {
  factory _$$PlanetTableModelImplCopyWith(_$PlanetTableModelImpl value,
          $Res Function(_$PlanetTableModelImpl) then) =
      __$$PlanetTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      String time,
      String latitude,
      String longitude,
      String timezone,
      List<PlanetModel> planets});
}

/// @nodoc
class __$$PlanetTableModelImplCopyWithImpl<$Res>
    extends _$PlanetTableModelCopyWithImpl<$Res, _$PlanetTableModelImpl>
    implements _$$PlanetTableModelImplCopyWith<$Res> {
  __$$PlanetTableModelImplCopyWithImpl(_$PlanetTableModelImpl _value,
      $Res Function(_$PlanetTableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? time = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? timezone = null,
    Object? planets = null,
  }) {
    return _then(_$PlanetTableModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      planets: null == planets
          ? _value._planets
          : planets // ignore: cast_nullable_to_non_nullable
              as List<PlanetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetTableModelImpl implements _PlanetTableModel {
  _$PlanetTableModelImpl(
      {required this.date,
      required this.time,
      required this.latitude,
      required this.longitude,
      required this.timezone,
      required final List<PlanetModel> planets})
      : _planets = planets;

  factory _$PlanetTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetTableModelImplFromJson(json);

  @override
  final String date;
  @override
  final String time;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String timezone;
  final List<PlanetModel> _planets;
  @override
  List<PlanetModel> get planets {
    if (_planets is EqualUnmodifiableListView) return _planets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planets);
  }

  @override
  String toString() {
    return 'PlanetTableModel(date: $date, time: $time, latitude: $latitude, longitude: $longitude, timezone: $timezone, planets: $planets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetTableModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(other._planets, _planets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, time, latitude, longitude,
      timezone, const DeepCollectionEquality().hash(_planets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetTableModelImplCopyWith<_$PlanetTableModelImpl> get copyWith =>
      __$$PlanetTableModelImplCopyWithImpl<_$PlanetTableModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetTableModelImplToJson(
      this,
    );
  }
}

abstract class _PlanetTableModel implements PlanetTableModel {
  factory _PlanetTableModel(
      {required final String date,
      required final String time,
      required final String latitude,
      required final String longitude,
      required final String timezone,
      required final List<PlanetModel> planets}) = _$PlanetTableModelImpl;

  factory _PlanetTableModel.fromJson(Map<String, dynamic> json) =
      _$PlanetTableModelImpl.fromJson;

  @override
  String get date;
  @override
  String get time;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get timezone;
  @override
  List<PlanetModel> get planets;
  @override
  @JsonKey(ignore: true)
  _$$PlanetTableModelImplCopyWith<_$PlanetTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
