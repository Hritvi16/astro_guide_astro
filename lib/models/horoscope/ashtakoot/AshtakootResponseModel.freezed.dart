// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AshtakootResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AshtakootResponseModel _$AshtakootResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AshtakootResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AshtakootResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AshtakootModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AshtakootResponseModelCopyWith<AshtakootResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AshtakootResponseModelCopyWith<$Res> {
  factory $AshtakootResponseModelCopyWith(AshtakootResponseModel value,
          $Res Function(AshtakootResponseModel) then) =
      _$AshtakootResponseModelCopyWithImpl<$Res, AshtakootResponseModel>;
  @useResult
  $Res call({String status, int code, String message, AshtakootModel? data});

  $AshtakootModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$AshtakootResponseModelCopyWithImpl<$Res,
        $Val extends AshtakootResponseModel>
    implements $AshtakootResponseModelCopyWith<$Res> {
  _$AshtakootResponseModelCopyWithImpl(this._value, this._then);

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
              as AshtakootModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AshtakootModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AshtakootModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AshtakootResponseModelImplCopyWith<$Res>
    implements $AshtakootResponseModelCopyWith<$Res> {
  factory _$$AshtakootResponseModelImplCopyWith(
          _$AshtakootResponseModelImpl value,
          $Res Function(_$AshtakootResponseModelImpl) then) =
      __$$AshtakootResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, AshtakootModel? data});

  @override
  $AshtakootModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AshtakootResponseModelImplCopyWithImpl<$Res>
    extends _$AshtakootResponseModelCopyWithImpl<$Res,
        _$AshtakootResponseModelImpl>
    implements _$$AshtakootResponseModelImplCopyWith<$Res> {
  __$$AshtakootResponseModelImplCopyWithImpl(
      _$AshtakootResponseModelImpl _value,
      $Res Function(_$AshtakootResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$AshtakootResponseModelImpl(
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
              as AshtakootModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AshtakootResponseModelImpl implements _AshtakootResponseModel {
  _$AshtakootResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$AshtakootResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AshtakootResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final AshtakootModel? data;

  @override
  String toString() {
    return 'AshtakootResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AshtakootResponseModelImpl &&
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
  _$$AshtakootResponseModelImplCopyWith<_$AshtakootResponseModelImpl>
      get copyWith => __$$AshtakootResponseModelImplCopyWithImpl<
          _$AshtakootResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AshtakootResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AshtakootResponseModel implements AshtakootResponseModel {
  factory _AshtakootResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final AshtakootModel? data}) = _$AshtakootResponseModelImpl;

  factory _AshtakootResponseModel.fromJson(Map<String, dynamic> json) =
      _$AshtakootResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  AshtakootModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$AshtakootResponseModelImplCopyWith<_$AshtakootResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
