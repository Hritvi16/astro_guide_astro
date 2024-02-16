// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChartDataModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartDataModel _$ChartDataModelFromJson(Map<String, dynamic> json) {
  return _ChartDataModel.fromJson(json);
}

/// @nodoc
mixin _$ChartDataModel {
  dynamic get sign_no => throw _privateConstructorUsedError;
  List<PlanetModel> get planet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartDataModelCopyWith<ChartDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataModelCopyWith<$Res> {
  factory $ChartDataModelCopyWith(
          ChartDataModel value, $Res Function(ChartDataModel) then) =
      _$ChartDataModelCopyWithImpl<$Res, ChartDataModel>;
  @useResult
  $Res call({dynamic sign_no, List<PlanetModel> planet});
}

/// @nodoc
class _$ChartDataModelCopyWithImpl<$Res, $Val extends ChartDataModel>
    implements $ChartDataModelCopyWith<$Res> {
  _$ChartDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign_no = freezed,
    Object? planet = null,
  }) {
    return _then(_value.copyWith(
      sign_no: freezed == sign_no
          ? _value.sign_no
          : sign_no // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planet: null == planet
          ? _value.planet
          : planet // ignore: cast_nullable_to_non_nullable
              as List<PlanetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataModelImplCopyWith<$Res>
    implements $ChartDataModelCopyWith<$Res> {
  factory _$$ChartDataModelImplCopyWith(_$ChartDataModelImpl value,
          $Res Function(_$ChartDataModelImpl) then) =
      __$$ChartDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic sign_no, List<PlanetModel> planet});
}

/// @nodoc
class __$$ChartDataModelImplCopyWithImpl<$Res>
    extends _$ChartDataModelCopyWithImpl<$Res, _$ChartDataModelImpl>
    implements _$$ChartDataModelImplCopyWith<$Res> {
  __$$ChartDataModelImplCopyWithImpl(
      _$ChartDataModelImpl _value, $Res Function(_$ChartDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign_no = freezed,
    Object? planet = null,
  }) {
    return _then(_$ChartDataModelImpl(
      sign_no: freezed == sign_no
          ? _value.sign_no
          : sign_no // ignore: cast_nullable_to_non_nullable
              as dynamic,
      planet: null == planet
          ? _value._planet
          : planet // ignore: cast_nullable_to_non_nullable
              as List<PlanetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartDataModelImpl implements _ChartDataModel {
  _$ChartDataModelImpl(
      {required this.sign_no, required final List<PlanetModel> planet})
      : _planet = planet;

  factory _$ChartDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartDataModelImplFromJson(json);

  @override
  final dynamic sign_no;
  final List<PlanetModel> _planet;
  @override
  List<PlanetModel> get planet {
    if (_planet is EqualUnmodifiableListView) return _planet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_planet);
  }

  @override
  String toString() {
    return 'ChartDataModel(sign_no: $sign_no, planet: $planet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataModelImpl &&
            const DeepCollectionEquality().equals(other.sign_no, sign_no) &&
            const DeepCollectionEquality().equals(other._planet, _planet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sign_no),
      const DeepCollectionEquality().hash(_planet));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataModelImplCopyWith<_$ChartDataModelImpl> get copyWith =>
      __$$ChartDataModelImplCopyWithImpl<_$ChartDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartDataModelImplToJson(
      this,
    );
  }
}

abstract class _ChartDataModel implements ChartDataModel {
  factory _ChartDataModel(
      {required final dynamic sign_no,
      required final List<PlanetModel> planet}) = _$ChartDataModelImpl;

  factory _ChartDataModel.fromJson(Map<String, dynamic> json) =
      _$ChartDataModelImpl.fromJson;

  @override
  dynamic get sign_no;
  @override
  List<PlanetModel> get planet;
  @override
  @JsonKey(ignore: true)
  _$$ChartDataModelImplCopyWith<_$ChartDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
