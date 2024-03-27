// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BasicKundliResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicKundliResponseModel _$BasicKundliResponseModelFromJson(
    Map<String, dynamic> json) {
  return _BasicKundliResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BasicKundliResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BasicKundliModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicKundliResponseModelCopyWith<BasicKundliResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicKundliResponseModelCopyWith<$Res> {
  factory $BasicKundliResponseModelCopyWith(BasicKundliResponseModel value,
          $Res Function(BasicKundliResponseModel) then) =
      _$BasicKundliResponseModelCopyWithImpl<$Res, BasicKundliResponseModel>;
  @useResult
  $Res call({String status, int code, String message, BasicKundliModel? data});

  $BasicKundliModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$BasicKundliResponseModelCopyWithImpl<$Res,
        $Val extends BasicKundliResponseModel>
    implements $BasicKundliResponseModelCopyWith<$Res> {
  _$BasicKundliResponseModelCopyWithImpl(this._value, this._then);

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
              as BasicKundliModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicKundliModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BasicKundliModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasicKundliResponseModelImplCopyWith<$Res>
    implements $BasicKundliResponseModelCopyWith<$Res> {
  factory _$$BasicKundliResponseModelImplCopyWith(
          _$BasicKundliResponseModelImpl value,
          $Res Function(_$BasicKundliResponseModelImpl) then) =
      __$$BasicKundliResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, BasicKundliModel? data});

  @override
  $BasicKundliModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BasicKundliResponseModelImplCopyWithImpl<$Res>
    extends _$BasicKundliResponseModelCopyWithImpl<$Res,
        _$BasicKundliResponseModelImpl>
    implements _$$BasicKundliResponseModelImplCopyWith<$Res> {
  __$$BasicKundliResponseModelImplCopyWithImpl(
      _$BasicKundliResponseModelImpl _value,
      $Res Function(_$BasicKundliResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$BasicKundliResponseModelImpl(
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
              as BasicKundliModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicKundliResponseModelImpl implements _BasicKundliResponseModel {
  _$BasicKundliResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$BasicKundliResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicKundliResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final BasicKundliModel? data;

  @override
  String toString() {
    return 'BasicKundliResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicKundliResponseModelImpl &&
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
  _$$BasicKundliResponseModelImplCopyWith<_$BasicKundliResponseModelImpl>
      get copyWith => __$$BasicKundliResponseModelImplCopyWithImpl<
          _$BasicKundliResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicKundliResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BasicKundliResponseModel implements BasicKundliResponseModel {
  factory _BasicKundliResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final BasicKundliModel? data}) = _$BasicKundliResponseModelImpl;

  factory _BasicKundliResponseModel.fromJson(Map<String, dynamic> json) =
      _$BasicKundliResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  BasicKundliModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$BasicKundliResponseModelImplCopyWith<_$BasicKundliResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
