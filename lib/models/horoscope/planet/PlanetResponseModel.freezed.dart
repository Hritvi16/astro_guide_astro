// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlanetResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanetResponseModel _$PlanetResponseModelFromJson(Map<String, dynamic> json) {
  return _PlanetResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PlanetResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PlanetTableModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanetResponseModelCopyWith<PlanetResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetResponseModelCopyWith<$Res> {
  factory $PlanetResponseModelCopyWith(
          PlanetResponseModel value, $Res Function(PlanetResponseModel) then) =
      _$PlanetResponseModelCopyWithImpl<$Res, PlanetResponseModel>;
  @useResult
  $Res call({String status, int code, String message, PlanetTableModel? data});

  $PlanetTableModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$PlanetResponseModelCopyWithImpl<$Res, $Val extends PlanetResponseModel>
    implements $PlanetResponseModelCopyWith<$Res> {
  _$PlanetResponseModelCopyWithImpl(this._value, this._then);

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
              as PlanetTableModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlanetTableModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PlanetTableModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlanetResponseModelImplCopyWith<$Res>
    implements $PlanetResponseModelCopyWith<$Res> {
  factory _$$PlanetResponseModelImplCopyWith(_$PlanetResponseModelImpl value,
          $Res Function(_$PlanetResponseModelImpl) then) =
      __$$PlanetResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, PlanetTableModel? data});

  @override
  $PlanetTableModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PlanetResponseModelImplCopyWithImpl<$Res>
    extends _$PlanetResponseModelCopyWithImpl<$Res, _$PlanetResponseModelImpl>
    implements _$$PlanetResponseModelImplCopyWith<$Res> {
  __$$PlanetResponseModelImplCopyWithImpl(_$PlanetResponseModelImpl _value,
      $Res Function(_$PlanetResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$PlanetResponseModelImpl(
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
              as PlanetTableModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetResponseModelImpl implements _PlanetResponseModel {
  _$PlanetResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$PlanetResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final PlanetTableModel? data;

  @override
  String toString() {
    return 'PlanetResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetResponseModelImpl &&
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
  _$$PlanetResponseModelImplCopyWith<_$PlanetResponseModelImpl> get copyWith =>
      __$$PlanetResponseModelImplCopyWithImpl<_$PlanetResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PlanetResponseModel implements PlanetResponseModel {
  factory _PlanetResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final PlanetTableModel? data}) = _$PlanetResponseModelImpl;

  factory _PlanetResponseModel.fromJson(Map<String, dynamic> json) =
      _$PlanetResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  PlanetTableModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$PlanetResponseModelImplCopyWith<_$PlanetResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
