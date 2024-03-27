// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SettingResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingResponseModel _$SettingResponseModelFromJson(Map<String, dynamic> json) {
  return _SettingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SettingResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SettingModel? get data => throw _privateConstructorUsedError;
  AstrologerModel? get astrologer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingResponseModelCopyWith<SettingResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingResponseModelCopyWith<$Res> {
  factory $SettingResponseModelCopyWith(SettingResponseModel value,
          $Res Function(SettingResponseModel) then) =
      _$SettingResponseModelCopyWithImpl<$Res, SettingResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SettingModel? data,
      AstrologerModel? astrologer});

  $SettingModelCopyWith<$Res>? get data;
  $AstrologerModelCopyWith<$Res>? get astrologer;
}

/// @nodoc
class _$SettingResponseModelCopyWithImpl<$Res,
        $Val extends SettingResponseModel>
    implements $SettingResponseModelCopyWith<$Res> {
  _$SettingResponseModelCopyWithImpl(this._value, this._then);

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
    Object? astrologer = freezed,
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
              as SettingModel?,
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SettingModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AstrologerModelCopyWith<$Res>? get astrologer {
    if (_value.astrologer == null) {
      return null;
    }

    return $AstrologerModelCopyWith<$Res>(_value.astrologer!, (value) {
      return _then(_value.copyWith(astrologer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingResponseModelImplCopyWith<$Res>
    implements $SettingResponseModelCopyWith<$Res> {
  factory _$$SettingResponseModelImplCopyWith(_$SettingResponseModelImpl value,
          $Res Function(_$SettingResponseModelImpl) then) =
      __$$SettingResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SettingModel? data,
      AstrologerModel? astrologer});

  @override
  $SettingModelCopyWith<$Res>? get data;
  @override
  $AstrologerModelCopyWith<$Res>? get astrologer;
}

/// @nodoc
class __$$SettingResponseModelImplCopyWithImpl<$Res>
    extends _$SettingResponseModelCopyWithImpl<$Res, _$SettingResponseModelImpl>
    implements _$$SettingResponseModelImplCopyWith<$Res> {
  __$$SettingResponseModelImplCopyWithImpl(_$SettingResponseModelImpl _value,
      $Res Function(_$SettingResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? astrologer = freezed,
  }) {
    return _then(_$SettingResponseModelImpl(
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
              as SettingModel?,
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingResponseModelImpl implements _SettingResponseModel {
  _$SettingResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      this.astrologer});

  factory _$SettingResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final SettingModel? data;
  @override
  final AstrologerModel? astrologer;

  @override
  String toString() {
    return 'SettingResponseModel(status: $status, code: $code, message: $message, data: $data, astrologer: $astrologer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.astrologer, astrologer) ||
                other.astrologer == astrologer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, data, astrologer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingResponseModelImplCopyWith<_$SettingResponseModelImpl>
      get copyWith =>
          __$$SettingResponseModelImplCopyWithImpl<_$SettingResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SettingResponseModel implements SettingResponseModel {
  factory _SettingResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final SettingModel? data,
      final AstrologerModel? astrologer}) = _$SettingResponseModelImpl;

  factory _SettingResponseModel.fromJson(Map<String, dynamic> json) =
      _$SettingResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  SettingModel? get data;
  @override
  AstrologerModel? get astrologer;
  @override
  @JsonKey(ignore: true)
  _$$SettingResponseModelImplCopyWith<_$SettingResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
