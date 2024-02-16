// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'WalletResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletResponseModel _$WalletResponseModelFromJson(Map<String, dynamic> json) {
  return _WalletResponseModel.fromJson(json);
}

/// @nodoc
mixin _$WalletResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  WalletModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletResponseModelCopyWith<WalletResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletResponseModelCopyWith<$Res> {
  factory $WalletResponseModelCopyWith(
          WalletResponseModel value, $Res Function(WalletResponseModel) then) =
      _$WalletResponseModelCopyWithImpl<$Res, WalletResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      WalletModel? data});

  $WalletModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$WalletResponseModelCopyWithImpl<$Res, $Val extends WalletResponseModel>
    implements $WalletResponseModelCopyWith<$Res> {
  _$WalletResponseModelCopyWithImpl(this._value, this._then);

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
    Object? amount = freezed,
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WalletModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletResponseModelImplCopyWith<$Res>
    implements $WalletResponseModelCopyWith<$Res> {
  factory _$$WalletResponseModelImplCopyWith(_$WalletResponseModelImpl value,
          $Res Function(_$WalletResponseModelImpl) then) =
      __$$WalletResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      WalletModel? data});

  @override
  $WalletModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$WalletResponseModelImplCopyWithImpl<$Res>
    extends _$WalletResponseModelCopyWithImpl<$Res, _$WalletResponseModelImpl>
    implements _$$WalletResponseModelImplCopyWith<$Res> {
  __$$WalletResponseModelImplCopyWithImpl(_$WalletResponseModelImpl _value,
      $Res Function(_$WalletResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? amount = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WalletResponseModelImpl(
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletResponseModelImpl implements _WalletResponseModel {
  _$WalletResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.amount,
      this.data});

  factory _$WalletResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final double? amount;
  @override
  final WalletModel? data;

  @override
  String toString() {
    return 'WalletResponseModel(status: $status, code: $code, message: $message, amount: $amount, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, amount, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletResponseModelImplCopyWith<_$WalletResponseModelImpl> get copyWith =>
      __$$WalletResponseModelImplCopyWithImpl<_$WalletResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletResponseModelImplToJson(
      this,
    );
  }
}

abstract class _WalletResponseModel implements WalletResponseModel {
  factory _WalletResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final double? amount,
      final WalletModel? data}) = _$WalletResponseModelImpl;

  factory _WalletResponseModel.fromJson(Map<String, dynamic> json) =
      _$WalletResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  double? get amount;
  @override
  WalletModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$WalletResponseModelImplCopyWith<_$WalletResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
