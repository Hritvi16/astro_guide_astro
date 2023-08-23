// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CheckChatResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckChatResponseModel _$CheckChatResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CheckChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckChatResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CheckChatModel? get data => throw _privateConstructorUsedError;
  List<CityModel>? get cities => throw _privateConstructorUsedError;
  String? get started_at => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckChatResponseModelCopyWith<CheckChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckChatResponseModelCopyWith<$Res> {
  factory $CheckChatResponseModelCopyWith(CheckChatResponseModel value,
          $Res Function(CheckChatResponseModel) then) =
      _$CheckChatResponseModelCopyWithImpl<$Res, CheckChatResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      CheckChatModel? data,
      List<CityModel>? cities,
      String? started_at,
      int? rate,
      String? type,
      double? wallet});

  $CheckChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$CheckChatResponseModelCopyWithImpl<$Res,
        $Val extends CheckChatResponseModel>
    implements $CheckChatResponseModelCopyWith<$Res> {
  _$CheckChatResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? cities = freezed,
    Object? started_at = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CheckChatModel?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      started_at: freezed == started_at
          ? _value.started_at
          : started_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckChatModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CheckChatModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CheckChatResponseModelCopyWith<$Res>
    implements $CheckChatResponseModelCopyWith<$Res> {
  factory _$$_CheckChatResponseModelCopyWith(_$_CheckChatResponseModel value,
          $Res Function(_$_CheckChatResponseModel) then) =
      __$$_CheckChatResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      CheckChatModel? data,
      List<CityModel>? cities,
      String? started_at,
      int? rate,
      String? type,
      double? wallet});

  @override
  $CheckChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CheckChatResponseModelCopyWithImpl<$Res>
    extends _$CheckChatResponseModelCopyWithImpl<$Res,
        _$_CheckChatResponseModel>
    implements _$$_CheckChatResponseModelCopyWith<$Res> {
  __$$_CheckChatResponseModelCopyWithImpl(_$_CheckChatResponseModel _value,
      $Res Function(_$_CheckChatResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? cities = freezed,
    Object? started_at = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$_CheckChatResponseModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CheckChatModel?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      started_at: freezed == started_at
          ? _value.started_at
          : started_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckChatResponseModel implements _CheckChatResponseModel {
  _$_CheckChatResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      final List<CityModel>? cities,
      this.started_at,
      this.rate,
      this.type,
      this.wallet})
      : _cities = cities;

  factory _$_CheckChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckChatResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final CheckChatModel? data;
  final List<CityModel>? _cities;
  @override
  List<CityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? started_at;
  @override
  final int? rate;
  @override
  final String? type;
  @override
  final double? wallet;

  @override
  String toString() {
    return 'CheckChatResponseModel(status: $status, code: $code, message: $message, data: $data, cities: $cities, started_at: $started_at, rate: $rate, type: $type, wallet: $wallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckChatResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.started_at, started_at) ||
                other.started_at == started_at) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      data,
      const DeepCollectionEquality().hash(_cities),
      started_at,
      rate,
      type,
      wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckChatResponseModelCopyWith<_$_CheckChatResponseModel> get copyWith =>
      __$$_CheckChatResponseModelCopyWithImpl<_$_CheckChatResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckChatResponseModelToJson(
      this,
    );
  }
}

abstract class _CheckChatResponseModel implements CheckChatResponseModel {
  factory _CheckChatResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final CheckChatModel? data,
      final List<CityModel>? cities,
      final String? started_at,
      final int? rate,
      final String? type,
      final double? wallet}) = _$_CheckChatResponseModel;

  factory _CheckChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CheckChatResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  CheckChatModel? get data;
  @override
  List<CityModel>? get cities;
  @override
  String? get started_at;
  @override
  int? get rate;
  @override
  String? get type;
  @override
  double? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$_CheckChatResponseModelCopyWith<_$_CheckChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
