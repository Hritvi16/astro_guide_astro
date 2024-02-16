// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SpecialModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecialModel _$SpecialModelFromJson(Map<String, dynamic> json) {
  return _SpecialModel.fromJson(json);
}

/// @nodoc
mixin _$SpecialModel {
  List<String> get lucky_color_codes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialModelCopyWith<SpecialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialModelCopyWith<$Res> {
  factory $SpecialModelCopyWith(
          SpecialModel value, $Res Function(SpecialModel) then) =
      _$SpecialModelCopyWithImpl<$Res, SpecialModel>;
  @useResult
  $Res call({List<String> lucky_color_codes});
}

/// @nodoc
class _$SpecialModelCopyWithImpl<$Res, $Val extends SpecialModel>
    implements $SpecialModelCopyWith<$Res> {
  _$SpecialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lucky_color_codes = null,
  }) {
    return _then(_value.copyWith(
      lucky_color_codes: null == lucky_color_codes
          ? _value.lucky_color_codes
          : lucky_color_codes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecialModelImplCopyWith<$Res>
    implements $SpecialModelCopyWith<$Res> {
  factory _$$SpecialModelImplCopyWith(
          _$SpecialModelImpl value, $Res Function(_$SpecialModelImpl) then) =
      __$$SpecialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> lucky_color_codes});
}

/// @nodoc
class __$$SpecialModelImplCopyWithImpl<$Res>
    extends _$SpecialModelCopyWithImpl<$Res, _$SpecialModelImpl>
    implements _$$SpecialModelImplCopyWith<$Res> {
  __$$SpecialModelImplCopyWithImpl(
      _$SpecialModelImpl _value, $Res Function(_$SpecialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lucky_color_codes = null,
  }) {
    return _then(_$SpecialModelImpl(
      lucky_color_codes: null == lucky_color_codes
          ? _value._lucky_color_codes
          : lucky_color_codes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecialModelImpl implements _SpecialModel {
  _$SpecialModelImpl({required final List<String> lucky_color_codes})
      : _lucky_color_codes = lucky_color_codes;

  factory _$SpecialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecialModelImplFromJson(json);

  final List<String> _lucky_color_codes;
  @override
  List<String> get lucky_color_codes {
    if (_lucky_color_codes is EqualUnmodifiableListView)
      return _lucky_color_codes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lucky_color_codes);
  }

  @override
  String toString() {
    return 'SpecialModel(lucky_color_codes: $lucky_color_codes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialModelImpl &&
            const DeepCollectionEquality()
                .equals(other._lucky_color_codes, _lucky_color_codes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lucky_color_codes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialModelImplCopyWith<_$SpecialModelImpl> get copyWith =>
      __$$SpecialModelImplCopyWithImpl<_$SpecialModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecialModelImplToJson(
      this,
    );
  }
}

abstract class _SpecialModel implements SpecialModel {
  factory _SpecialModel({required final List<String> lucky_color_codes}) =
      _$SpecialModelImpl;

  factory _SpecialModel.fromJson(Map<String, dynamic> json) =
      _$SpecialModelImpl.fromJson;

  @override
  List<String> get lucky_color_codes;
  @override
  @JsonKey(ignore: true)
  _$$SpecialModelImplCopyWith<_$SpecialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
