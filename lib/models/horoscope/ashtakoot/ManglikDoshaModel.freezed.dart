// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ManglikDoshaModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManglikDoshaModel _$ManglikDoshaModelFromJson(Map<String, dynamic> json) {
  return _ManglikDoshaModel.fromJson(json);
}

/// @nodoc
mixin _$ManglikDoshaModel {
  String get p1 => throw _privateConstructorUsedError;
  String get p2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManglikDoshaModelCopyWith<ManglikDoshaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManglikDoshaModelCopyWith<$Res> {
  factory $ManglikDoshaModelCopyWith(
          ManglikDoshaModel value, $Res Function(ManglikDoshaModel) then) =
      _$ManglikDoshaModelCopyWithImpl<$Res, ManglikDoshaModel>;
  @useResult
  $Res call({String p1, String p2});
}

/// @nodoc
class _$ManglikDoshaModelCopyWithImpl<$Res, $Val extends ManglikDoshaModel>
    implements $ManglikDoshaModelCopyWith<$Res> {
  _$ManglikDoshaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p1 = null,
    Object? p2 = null,
  }) {
    return _then(_value.copyWith(
      p1: null == p1
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as String,
      p2: null == p2
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManglikDoshaModelImplCopyWith<$Res>
    implements $ManglikDoshaModelCopyWith<$Res> {
  factory _$$ManglikDoshaModelImplCopyWith(_$ManglikDoshaModelImpl value,
          $Res Function(_$ManglikDoshaModelImpl) then) =
      __$$ManglikDoshaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String p1, String p2});
}

/// @nodoc
class __$$ManglikDoshaModelImplCopyWithImpl<$Res>
    extends _$ManglikDoshaModelCopyWithImpl<$Res, _$ManglikDoshaModelImpl>
    implements _$$ManglikDoshaModelImplCopyWith<$Res> {
  __$$ManglikDoshaModelImplCopyWithImpl(_$ManglikDoshaModelImpl _value,
      $Res Function(_$ManglikDoshaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p1 = null,
    Object? p2 = null,
  }) {
    return _then(_$ManglikDoshaModelImpl(
      p1: null == p1
          ? _value.p1
          : p1 // ignore: cast_nullable_to_non_nullable
              as String,
      p2: null == p2
          ? _value.p2
          : p2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ManglikDoshaModelImpl implements _ManglikDoshaModel {
  _$ManglikDoshaModelImpl({required this.p1, required this.p2});

  factory _$ManglikDoshaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManglikDoshaModelImplFromJson(json);

  @override
  final String p1;
  @override
  final String p2;

  @override
  String toString() {
    return 'ManglikDoshaModel(p1: $p1, p2: $p2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManglikDoshaModelImpl &&
            (identical(other.p1, p1) || other.p1 == p1) &&
            (identical(other.p2, p2) || other.p2 == p2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, p1, p2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManglikDoshaModelImplCopyWith<_$ManglikDoshaModelImpl> get copyWith =>
      __$$ManglikDoshaModelImplCopyWithImpl<_$ManglikDoshaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ManglikDoshaModelImplToJson(
      this,
    );
  }
}

abstract class _ManglikDoshaModel implements ManglikDoshaModel {
  factory _ManglikDoshaModel(
      {required final String p1,
      required final String p2}) = _$ManglikDoshaModelImpl;

  factory _ManglikDoshaModel.fromJson(Map<String, dynamic> json) =
      _$ManglikDoshaModelImpl.fromJson;

  @override
  String get p1;
  @override
  String get p2;
  @override
  @JsonKey(ignore: true)
  _$$ManglikDoshaModelImplCopyWith<_$ManglikDoshaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
