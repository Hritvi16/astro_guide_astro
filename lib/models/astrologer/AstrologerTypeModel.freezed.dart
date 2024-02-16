// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerTypeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AstrologerTypeModel _$AstrologerTypeModelFromJson(Map<String, dynamic> json) {
  return _AstrologerTypeModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerTypeModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<TypeModel>? get data => throw _privateConstructorUsedError;
  List<TypeModel>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerTypeModelCopyWith<AstrologerTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerTypeModelCopyWith<$Res> {
  factory $AstrologerTypeModelCopyWith(
          AstrologerTypeModel value, $Res Function(AstrologerTypeModel) then) =
      _$AstrologerTypeModelCopyWithImpl<$Res, AstrologerTypeModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<TypeModel>? data,
      List<TypeModel>? types});
}

/// @nodoc
class _$AstrologerTypeModelCopyWithImpl<$Res, $Val extends AstrologerTypeModel>
    implements $AstrologerTypeModelCopyWith<$Res> {
  _$AstrologerTypeModelCopyWithImpl(this._value, this._then);

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
    Object? types = freezed,
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
              as List<TypeModel>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AstrologerTypeModelImplCopyWith<$Res>
    implements $AstrologerTypeModelCopyWith<$Res> {
  factory _$$AstrologerTypeModelImplCopyWith(_$AstrologerTypeModelImpl value,
          $Res Function(_$AstrologerTypeModelImpl) then) =
      __$$AstrologerTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<TypeModel>? data,
      List<TypeModel>? types});
}

/// @nodoc
class __$$AstrologerTypeModelImplCopyWithImpl<$Res>
    extends _$AstrologerTypeModelCopyWithImpl<$Res, _$AstrologerTypeModelImpl>
    implements _$$AstrologerTypeModelImplCopyWith<$Res> {
  __$$AstrologerTypeModelImplCopyWithImpl(_$AstrologerTypeModelImpl _value,
      $Res Function(_$AstrologerTypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? types = freezed,
  }) {
    return _then(_$AstrologerTypeModelImpl(
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
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerTypeModelImpl implements _AstrologerTypeModel {
  _$AstrologerTypeModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<TypeModel>? data,
      final List<TypeModel>? types})
      : _data = data,
        _types = types;

  factory _$AstrologerTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerTypeModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<TypeModel>? _data;
  @override
  List<TypeModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TypeModel>? _types;
  @override
  List<TypeModel>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerTypeModel(status: $status, code: $code, message: $message, data: $data, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerTypeModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstrologerTypeModelImplCopyWith<_$AstrologerTypeModelImpl> get copyWith =>
      __$$AstrologerTypeModelImplCopyWithImpl<_$AstrologerTypeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerTypeModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerTypeModel implements AstrologerTypeModel {
  factory _AstrologerTypeModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<TypeModel>? data,
      final List<TypeModel>? types}) = _$AstrologerTypeModelImpl;

  factory _AstrologerTypeModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerTypeModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<TypeModel>? get data;
  @override
  List<TypeModel>? get types;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerTypeModelImplCopyWith<_$AstrologerTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
