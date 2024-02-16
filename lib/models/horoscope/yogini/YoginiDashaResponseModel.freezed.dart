// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'YoginiDashaResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YoginiDashaResponseModel _$YoginiDashaResponseModelFromJson(
    Map<String, dynamic> json) {
  return _YoginiDashaResponseModel.fromJson(json);
}

/// @nodoc
mixin _$YoginiDashaResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  YoginiDashaModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YoginiDashaResponseModelCopyWith<YoginiDashaResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoginiDashaResponseModelCopyWith<$Res> {
  factory $YoginiDashaResponseModelCopyWith(YoginiDashaResponseModel value,
          $Res Function(YoginiDashaResponseModel) then) =
      _$YoginiDashaResponseModelCopyWithImpl<$Res, YoginiDashaResponseModel>;
  @useResult
  $Res call({String status, int code, String message, YoginiDashaModel? data});

  $YoginiDashaModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$YoginiDashaResponseModelCopyWithImpl<$Res,
        $Val extends YoginiDashaResponseModel>
    implements $YoginiDashaResponseModelCopyWith<$Res> {
  _$YoginiDashaResponseModelCopyWithImpl(this._value, this._then);

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
              as YoginiDashaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YoginiDashaModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $YoginiDashaModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YoginiDashaResponseModelImplCopyWith<$Res>
    implements $YoginiDashaResponseModelCopyWith<$Res> {
  factory _$$YoginiDashaResponseModelImplCopyWith(
          _$YoginiDashaResponseModelImpl value,
          $Res Function(_$YoginiDashaResponseModelImpl) then) =
      __$$YoginiDashaResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, YoginiDashaModel? data});

  @override
  $YoginiDashaModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$YoginiDashaResponseModelImplCopyWithImpl<$Res>
    extends _$YoginiDashaResponseModelCopyWithImpl<$Res,
        _$YoginiDashaResponseModelImpl>
    implements _$$YoginiDashaResponseModelImplCopyWith<$Res> {
  __$$YoginiDashaResponseModelImplCopyWithImpl(
      _$YoginiDashaResponseModelImpl _value,
      $Res Function(_$YoginiDashaResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$YoginiDashaResponseModelImpl(
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
              as YoginiDashaModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoginiDashaResponseModelImpl implements _YoginiDashaResponseModel {
  _$YoginiDashaResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$YoginiDashaResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoginiDashaResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final YoginiDashaModel? data;

  @override
  String toString() {
    return 'YoginiDashaResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoginiDashaResponseModelImpl &&
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
  _$$YoginiDashaResponseModelImplCopyWith<_$YoginiDashaResponseModelImpl>
      get copyWith => __$$YoginiDashaResponseModelImplCopyWithImpl<
          _$YoginiDashaResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoginiDashaResponseModelImplToJson(
      this,
    );
  }
}

abstract class _YoginiDashaResponseModel implements YoginiDashaResponseModel {
  factory _YoginiDashaResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final YoginiDashaModel? data}) = _$YoginiDashaResponseModelImpl;

  factory _YoginiDashaResponseModel.fromJson(Map<String, dynamic> json) =
      _$YoginiDashaResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  YoginiDashaModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$YoginiDashaResponseModelImplCopyWith<_$YoginiDashaResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
