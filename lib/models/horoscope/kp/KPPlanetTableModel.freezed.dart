// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'KPPlanetTableModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KPPlanetTableModel _$KPPlanetTableModelFromJson(Map<String, dynamic> json) {
  return _KPPlanetTableModel.fromJson(json);
}

/// @nodoc
mixin _$KPPlanetTableModel {
  List<KPPlanetModel> get table_data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KPPlanetTableModelCopyWith<KPPlanetTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KPPlanetTableModelCopyWith<$Res> {
  factory $KPPlanetTableModelCopyWith(
          KPPlanetTableModel value, $Res Function(KPPlanetTableModel) then) =
      _$KPPlanetTableModelCopyWithImpl<$Res, KPPlanetTableModel>;
  @useResult
  $Res call({List<KPPlanetModel> table_data});
}

/// @nodoc
class _$KPPlanetTableModelCopyWithImpl<$Res, $Val extends KPPlanetTableModel>
    implements $KPPlanetTableModelCopyWith<$Res> {
  _$KPPlanetTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table_data = null,
  }) {
    return _then(_value.copyWith(
      table_data: null == table_data
          ? _value.table_data
          : table_data // ignore: cast_nullable_to_non_nullable
              as List<KPPlanetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KPPlanetTableModelImplCopyWith<$Res>
    implements $KPPlanetTableModelCopyWith<$Res> {
  factory _$$KPPlanetTableModelImplCopyWith(_$KPPlanetTableModelImpl value,
          $Res Function(_$KPPlanetTableModelImpl) then) =
      __$$KPPlanetTableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<KPPlanetModel> table_data});
}

/// @nodoc
class __$$KPPlanetTableModelImplCopyWithImpl<$Res>
    extends _$KPPlanetTableModelCopyWithImpl<$Res, _$KPPlanetTableModelImpl>
    implements _$$KPPlanetTableModelImplCopyWith<$Res> {
  __$$KPPlanetTableModelImplCopyWithImpl(_$KPPlanetTableModelImpl _value,
      $Res Function(_$KPPlanetTableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table_data = null,
  }) {
    return _then(_$KPPlanetTableModelImpl(
      table_data: null == table_data
          ? _value._table_data
          : table_data // ignore: cast_nullable_to_non_nullable
              as List<KPPlanetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KPPlanetTableModelImpl implements _KPPlanetTableModel {
  _$KPPlanetTableModelImpl({required final List<KPPlanetModel> table_data})
      : _table_data = table_data;

  factory _$KPPlanetTableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KPPlanetTableModelImplFromJson(json);

  final List<KPPlanetModel> _table_data;
  @override
  List<KPPlanetModel> get table_data {
    if (_table_data is EqualUnmodifiableListView) return _table_data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_table_data);
  }

  @override
  String toString() {
    return 'KPPlanetTableModel(table_data: $table_data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KPPlanetTableModelImpl &&
            const DeepCollectionEquality()
                .equals(other._table_data, _table_data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_table_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KPPlanetTableModelImplCopyWith<_$KPPlanetTableModelImpl> get copyWith =>
      __$$KPPlanetTableModelImplCopyWithImpl<_$KPPlanetTableModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KPPlanetTableModelImplToJson(
      this,
    );
  }
}

abstract class _KPPlanetTableModel implements KPPlanetTableModel {
  factory _KPPlanetTableModel({required final List<KPPlanetModel> table_data}) =
      _$KPPlanetTableModelImpl;

  factory _KPPlanetTableModel.fromJson(Map<String, dynamic> json) =
      _$KPPlanetTableModelImpl.fromJson;

  @override
  List<KPPlanetModel> get table_data;
  @override
  @JsonKey(ignore: true)
  _$$KPPlanetTableModelImplCopyWith<_$KPPlanetTableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
