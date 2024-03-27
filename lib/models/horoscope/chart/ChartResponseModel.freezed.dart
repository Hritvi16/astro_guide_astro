// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChartResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartResponseModel _$ChartResponseModelFromJson(Map<String, dynamic> json) {
  return _ChartResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChartResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ChartModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartResponseModelCopyWith<ChartResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartResponseModelCopyWith<$Res> {
  factory $ChartResponseModelCopyWith(
          ChartResponseModel value, $Res Function(ChartResponseModel) then) =
      _$ChartResponseModelCopyWithImpl<$Res, ChartResponseModel>;
  @useResult
  $Res call({String status, int code, String message, ChartModel? data});

  $ChartModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChartResponseModelCopyWithImpl<$Res, $Val extends ChartResponseModel>
    implements $ChartResponseModelCopyWith<$Res> {
  _$ChartResponseModelCopyWithImpl(this._value, this._then);

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
              as ChartModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChartModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChartModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartResponseModelImplCopyWith<$Res>
    implements $ChartResponseModelCopyWith<$Res> {
  factory _$$ChartResponseModelImplCopyWith(_$ChartResponseModelImpl value,
          $Res Function(_$ChartResponseModelImpl) then) =
      __$$ChartResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, ChartModel? data});

  @override
  $ChartModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ChartResponseModelImplCopyWithImpl<$Res>
    extends _$ChartResponseModelCopyWithImpl<$Res, _$ChartResponseModelImpl>
    implements _$$ChartResponseModelImplCopyWith<$Res> {
  __$$ChartResponseModelImplCopyWithImpl(_$ChartResponseModelImpl _value,
      $Res Function(_$ChartResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ChartResponseModelImpl(
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
              as ChartModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartResponseModelImpl implements _ChartResponseModel {
  _$ChartResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$ChartResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final ChartModel? data;

  @override
  String toString() {
    return 'ChartResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartResponseModelImpl &&
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
  _$$ChartResponseModelImplCopyWith<_$ChartResponseModelImpl> get copyWith =>
      __$$ChartResponseModelImplCopyWithImpl<_$ChartResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ChartResponseModel implements ChartResponseModel {
  factory _ChartResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final ChartModel? data}) = _$ChartResponseModelImpl;

  factory _ChartResponseModel.fromJson(Map<String, dynamic> json) =
      _$ChartResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  ChartModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$ChartResponseModelImplCopyWith<_$ChartResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
