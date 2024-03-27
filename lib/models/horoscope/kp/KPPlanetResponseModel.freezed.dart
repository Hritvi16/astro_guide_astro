// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'KPPlanetResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KPPlanetResponseModel _$KPPlanetResponseModelFromJson(
    Map<String, dynamic> json) {
  return _KPPlanetResponseModel.fromJson(json);
}

/// @nodoc
mixin _$KPPlanetResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  KPPlanetTableModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KPPlanetResponseModelCopyWith<KPPlanetResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KPPlanetResponseModelCopyWith<$Res> {
  factory $KPPlanetResponseModelCopyWith(KPPlanetResponseModel value,
          $Res Function(KPPlanetResponseModel) then) =
      _$KPPlanetResponseModelCopyWithImpl<$Res, KPPlanetResponseModel>;
  @useResult
  $Res call(
      {String status, int code, String message, KPPlanetTableModel? data});

  $KPPlanetTableModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$KPPlanetResponseModelCopyWithImpl<$Res,
        $Val extends KPPlanetResponseModel>
    implements $KPPlanetResponseModelCopyWith<$Res> {
  _$KPPlanetResponseModelCopyWithImpl(this._value, this._then);

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
              as KPPlanetTableModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KPPlanetTableModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $KPPlanetTableModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KPPlanetResponseModelImplCopyWith<$Res>
    implements $KPPlanetResponseModelCopyWith<$Res> {
  factory _$$KPPlanetResponseModelImplCopyWith(
          _$KPPlanetResponseModelImpl value,
          $Res Function(_$KPPlanetResponseModelImpl) then) =
      __$$KPPlanetResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, KPPlanetTableModel? data});

  @override
  $KPPlanetTableModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$KPPlanetResponseModelImplCopyWithImpl<$Res>
    extends _$KPPlanetResponseModelCopyWithImpl<$Res,
        _$KPPlanetResponseModelImpl>
    implements _$$KPPlanetResponseModelImplCopyWith<$Res> {
  __$$KPPlanetResponseModelImplCopyWithImpl(_$KPPlanetResponseModelImpl _value,
      $Res Function(_$KPPlanetResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$KPPlanetResponseModelImpl(
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
              as KPPlanetTableModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KPPlanetResponseModelImpl implements _KPPlanetResponseModel {
  _$KPPlanetResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$KPPlanetResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KPPlanetResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final KPPlanetTableModel? data;

  @override
  String toString() {
    return 'KPPlanetResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KPPlanetResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KPPlanetResponseModelImplCopyWith<_$KPPlanetResponseModelImpl>
      get copyWith => __$$KPPlanetResponseModelImplCopyWithImpl<
          _$KPPlanetResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KPPlanetResponseModelImplToJson(
      this,
    );
  }
}

abstract class _KPPlanetResponseModel implements KPPlanetResponseModel {
  factory _KPPlanetResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final KPPlanetTableModel? data}) = _$KPPlanetResponseModelImpl;

  factory _KPPlanetResponseModel.fromJson(Map<String, dynamic> json) =
      _$KPPlanetResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  KPPlanetTableModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$KPPlanetResponseModelImplCopyWith<_$KPPlanetResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
