// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PayaModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayaModel _$PayaModelFromJson(Map<String, dynamic> json) {
  return _PayaModel.fromJson(json);
}

/// @nodoc
mixin _$PayaModel {
  String get type => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayaModelCopyWith<PayaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayaModelCopyWith<$Res> {
  factory $PayaModelCopyWith(PayaModel value, $Res Function(PayaModel) then) =
      _$PayaModelCopyWithImpl<$Res, PayaModel>;
  @useResult
  $Res call({String type, String result});
}

/// @nodoc
class _$PayaModelCopyWithImpl<$Res, $Val extends PayaModel>
    implements $PayaModelCopyWith<$Res> {
  _$PayaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayaModelImplCopyWith<$Res>
    implements $PayaModelCopyWith<$Res> {
  factory _$$PayaModelImplCopyWith(
          _$PayaModelImpl value, $Res Function(_$PayaModelImpl) then) =
      __$$PayaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String result});
}

/// @nodoc
class __$$PayaModelImplCopyWithImpl<$Res>
    extends _$PayaModelCopyWithImpl<$Res, _$PayaModelImpl>
    implements _$$PayaModelImplCopyWith<$Res> {
  __$$PayaModelImplCopyWithImpl(
      _$PayaModelImpl _value, $Res Function(_$PayaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? result = null,
  }) {
    return _then(_$PayaModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayaModelImpl implements _PayaModel {
  _$PayaModelImpl({required this.type, required this.result});

  factory _$PayaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayaModelImplFromJson(json);

  @override
  final String type;
  @override
  final String result;

  @override
  String toString() {
    return 'PayaModel(type: $type, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayaModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayaModelImplCopyWith<_$PayaModelImpl> get copyWith =>
      __$$PayaModelImplCopyWithImpl<_$PayaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayaModelImplToJson(
      this,
    );
  }
}

abstract class _PayaModel implements PayaModel {
  factory _PayaModel(
      {required final String type,
      required final String result}) = _$PayaModelImpl;

  factory _PayaModel.fromJson(Map<String, dynamic> json) =
      _$PayaModelImpl.fromJson;

  @override
  String get type;
  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$PayaModelImplCopyWith<_$PayaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
