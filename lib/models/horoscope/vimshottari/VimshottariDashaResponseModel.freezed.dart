// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'VimshottariDashaResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VimshottariDashaResponseModel _$VimshottariDashaResponseModelFromJson(
    Map<String, dynamic> json) {
  return _VimshottariDashaResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VimshottariDashaResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  VimshottariDashaModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VimshottariDashaResponseModelCopyWith<VimshottariDashaResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VimshottariDashaResponseModelCopyWith<$Res> {
  factory $VimshottariDashaResponseModelCopyWith(
          VimshottariDashaResponseModel value,
          $Res Function(VimshottariDashaResponseModel) then) =
      _$VimshottariDashaResponseModelCopyWithImpl<$Res,
          VimshottariDashaResponseModel>;
  @useResult
  $Res call(
      {String status, int code, String message, VimshottariDashaModel? data});

  $VimshottariDashaModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$VimshottariDashaResponseModelCopyWithImpl<$Res,
        $Val extends VimshottariDashaResponseModel>
    implements $VimshottariDashaResponseModelCopyWith<$Res> {
  _$VimshottariDashaResponseModelCopyWithImpl(this._value, this._then);

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
              as VimshottariDashaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VimshottariDashaModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $VimshottariDashaModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VimshottariDashaResponseModelImplCopyWith<$Res>
    implements $VimshottariDashaResponseModelCopyWith<$Res> {
  factory _$$VimshottariDashaResponseModelImplCopyWith(
          _$VimshottariDashaResponseModelImpl value,
          $Res Function(_$VimshottariDashaResponseModelImpl) then) =
      __$$VimshottariDashaResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, VimshottariDashaModel? data});

  @override
  $VimshottariDashaModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VimshottariDashaResponseModelImplCopyWithImpl<$Res>
    extends _$VimshottariDashaResponseModelCopyWithImpl<$Res,
        _$VimshottariDashaResponseModelImpl>
    implements _$$VimshottariDashaResponseModelImplCopyWith<$Res> {
  __$$VimshottariDashaResponseModelImplCopyWithImpl(
      _$VimshottariDashaResponseModelImpl _value,
      $Res Function(_$VimshottariDashaResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$VimshottariDashaResponseModelImpl(
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
              as VimshottariDashaModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VimshottariDashaResponseModelImpl
    implements _VimshottariDashaResponseModel {
  _$VimshottariDashaResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$VimshottariDashaResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VimshottariDashaResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final VimshottariDashaModel? data;

  @override
  String toString() {
    return 'VimshottariDashaResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VimshottariDashaResponseModelImpl &&
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
  _$$VimshottariDashaResponseModelImplCopyWith<
          _$VimshottariDashaResponseModelImpl>
      get copyWith => __$$VimshottariDashaResponseModelImplCopyWithImpl<
          _$VimshottariDashaResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VimshottariDashaResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VimshottariDashaResponseModel
    implements VimshottariDashaResponseModel {
  factory _VimshottariDashaResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final VimshottariDashaModel? data}) = _$VimshottariDashaResponseModelImpl;

  factory _VimshottariDashaResponseModel.fromJson(Map<String, dynamic> json) =
      _$VimshottariDashaResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  VimshottariDashaModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$VimshottariDashaResponseModelImplCopyWith<
          _$VimshottariDashaResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
