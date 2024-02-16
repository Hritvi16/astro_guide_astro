// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PlanetModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanetModel _$PlanetModelFromJson(Map<String, dynamic> json) {
  return _PlanetModel.fromJson(json);
}

/// @nodoc
mixin _$PlanetModel {
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanetModelCopyWith<PlanetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetModelCopyWith<$Res> {
  factory $PlanetModelCopyWith(
          PlanetModel value, $Res Function(PlanetModel) then) =
      _$PlanetModelCopyWithImpl<$Res, PlanetModel>;
  @useResult
  $Res call({String name, String symbol});
}

/// @nodoc
class _$PlanetModelCopyWithImpl<$Res, $Val extends PlanetModel>
    implements $PlanetModelCopyWith<$Res> {
  _$PlanetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanetModelImplCopyWith<$Res>
    implements $PlanetModelCopyWith<$Res> {
  factory _$$PlanetModelImplCopyWith(
          _$PlanetModelImpl value, $Res Function(_$PlanetModelImpl) then) =
      __$$PlanetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String symbol});
}

/// @nodoc
class __$$PlanetModelImplCopyWithImpl<$Res>
    extends _$PlanetModelCopyWithImpl<$Res, _$PlanetModelImpl>
    implements _$$PlanetModelImplCopyWith<$Res> {
  __$$PlanetModelImplCopyWithImpl(
      _$PlanetModelImpl _value, $Res Function(_$PlanetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? symbol = null,
  }) {
    return _then(_$PlanetModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetModelImpl implements _PlanetModel {
  _$PlanetModelImpl({required this.name, required this.symbol});

  factory _$PlanetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetModelImplFromJson(json);

  @override
  final String name;
  @override
  final String symbol;

  @override
  String toString() {
    return 'PlanetModel(name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetModelImplCopyWith<_$PlanetModelImpl> get copyWith =>
      __$$PlanetModelImplCopyWithImpl<_$PlanetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetModelImplToJson(
      this,
    );
  }
}

abstract class _PlanetModel implements PlanetModel {
  factory _PlanetModel(
      {required final String name,
      required final String symbol}) = _$PlanetModelImpl;

  factory _PlanetModel.fromJson(Map<String, dynamic> json) =
      _$PlanetModelImpl.fromJson;

  @override
  String get name;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$PlanetModelImplCopyWith<_$PlanetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
