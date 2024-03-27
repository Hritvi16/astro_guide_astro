// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'YogMahaDashaModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YogMahaDashaModel _$YogMahaDashaModelFromJson(Map<String, dynamic> json) {
  return _YogMahaDashaModel.fromJson(json);
}

/// @nodoc
mixin _$YogMahaDashaModel {
  String get dasha => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  YogAntarDashaModel get antar_dasha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YogMahaDashaModelCopyWith<YogMahaDashaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YogMahaDashaModelCopyWith<$Res> {
  factory $YogMahaDashaModelCopyWith(
          YogMahaDashaModel value, $Res Function(YogMahaDashaModel) then) =
      _$YogMahaDashaModelCopyWithImpl<$Res, YogMahaDashaModel>;
  @useResult
  $Res call(
      {String dasha,
      String start_date,
      String end_date,
      YogAntarDashaModel antar_dasha});

  $YogAntarDashaModelCopyWith<$Res> get antar_dasha;
}

/// @nodoc
class _$YogMahaDashaModelCopyWithImpl<$Res, $Val extends YogMahaDashaModel>
    implements $YogMahaDashaModelCopyWith<$Res> {
  _$YogMahaDashaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dasha = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? antar_dasha = null,
  }) {
    return _then(_value.copyWith(
      dasha: null == dasha
          ? _value.dasha
          : dasha // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      antar_dasha: null == antar_dasha
          ? _value.antar_dasha
          : antar_dasha // ignore: cast_nullable_to_non_nullable
              as YogAntarDashaModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YogAntarDashaModelCopyWith<$Res> get antar_dasha {
    return $YogAntarDashaModelCopyWith<$Res>(_value.antar_dasha, (value) {
      return _then(_value.copyWith(antar_dasha: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$YogMahaDashaModelImplCopyWith<$Res>
    implements $YogMahaDashaModelCopyWith<$Res> {
  factory _$$YogMahaDashaModelImplCopyWith(_$YogMahaDashaModelImpl value,
          $Res Function(_$YogMahaDashaModelImpl) then) =
      __$$YogMahaDashaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dasha,
      String start_date,
      String end_date,
      YogAntarDashaModel antar_dasha});

  @override
  $YogAntarDashaModelCopyWith<$Res> get antar_dasha;
}

/// @nodoc
class __$$YogMahaDashaModelImplCopyWithImpl<$Res>
    extends _$YogMahaDashaModelCopyWithImpl<$Res, _$YogMahaDashaModelImpl>
    implements _$$YogMahaDashaModelImplCopyWith<$Res> {
  __$$YogMahaDashaModelImplCopyWithImpl(_$YogMahaDashaModelImpl _value,
      $Res Function(_$YogMahaDashaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dasha = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? antar_dasha = null,
  }) {
    return _then(_$YogMahaDashaModelImpl(
      dasha: null == dasha
          ? _value.dasha
          : dasha // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      antar_dasha: null == antar_dasha
          ? _value.antar_dasha
          : antar_dasha // ignore: cast_nullable_to_non_nullable
              as YogAntarDashaModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YogMahaDashaModelImpl implements _YogMahaDashaModel {
  _$YogMahaDashaModelImpl(
      {required this.dasha,
      required this.start_date,
      required this.end_date,
      required this.antar_dasha});

  factory _$YogMahaDashaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YogMahaDashaModelImplFromJson(json);

  @override
  final String dasha;
  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final YogAntarDashaModel antar_dasha;

  @override
  String toString() {
    return 'YogMahaDashaModel(dasha: $dasha, start_date: $start_date, end_date: $end_date, antar_dasha: $antar_dasha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YogMahaDashaModelImpl &&
            (identical(other.dasha, dasha) || other.dasha == dasha) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.antar_dasha, antar_dasha) ||
                other.antar_dasha == antar_dasha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dasha, start_date, end_date, antar_dasha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YogMahaDashaModelImplCopyWith<_$YogMahaDashaModelImpl> get copyWith =>
      __$$YogMahaDashaModelImplCopyWithImpl<_$YogMahaDashaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YogMahaDashaModelImplToJson(
      this,
    );
  }
}

abstract class _YogMahaDashaModel implements YogMahaDashaModel {
  factory _YogMahaDashaModel(
      {required final String dasha,
      required final String start_date,
      required final String end_date,
      required final YogAntarDashaModel antar_dasha}) = _$YogMahaDashaModelImpl;

  factory _YogMahaDashaModel.fromJson(Map<String, dynamic> json) =
      _$YogMahaDashaModelImpl.fromJson;

  @override
  String get dasha;
  @override
  String get start_date;
  @override
  String get end_date;
  @override
  YogAntarDashaModel get antar_dasha;
  @override
  @JsonKey(ignore: true)
  _$$YogMahaDashaModelImplCopyWith<_$YogMahaDashaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
