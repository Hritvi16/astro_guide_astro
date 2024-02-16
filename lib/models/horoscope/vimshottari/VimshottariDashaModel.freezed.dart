// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'VimshottariDashaModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VimshottariDashaModel _$VimshottariDashaModelFromJson(
    Map<String, dynamic> json) {
  return _VimshottariDashaModel.fromJson(json);
}

/// @nodoc
mixin _$VimshottariDashaModel {
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  VimMahaDashaModel get maha_dasha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VimshottariDashaModelCopyWith<VimshottariDashaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VimshottariDashaModelCopyWith<$Res> {
  factory $VimshottariDashaModelCopyWith(VimshottariDashaModel value,
          $Res Function(VimshottariDashaModel) then) =
      _$VimshottariDashaModelCopyWithImpl<$Res, VimshottariDashaModel>;
  @useResult
  $Res call({String date, String time, VimMahaDashaModel maha_dasha});

  $VimMahaDashaModelCopyWith<$Res> get maha_dasha;
}

/// @nodoc
class _$VimshottariDashaModelCopyWithImpl<$Res,
        $Val extends VimshottariDashaModel>
    implements $VimshottariDashaModelCopyWith<$Res> {
  _$VimshottariDashaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? time = null,
    Object? maha_dasha = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      maha_dasha: null == maha_dasha
          ? _value.maha_dasha
          : maha_dasha // ignore: cast_nullable_to_non_nullable
              as VimMahaDashaModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VimMahaDashaModelCopyWith<$Res> get maha_dasha {
    return $VimMahaDashaModelCopyWith<$Res>(_value.maha_dasha, (value) {
      return _then(_value.copyWith(maha_dasha: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VimshottariDashaModelImplCopyWith<$Res>
    implements $VimshottariDashaModelCopyWith<$Res> {
  factory _$$VimshottariDashaModelImplCopyWith(
          _$VimshottariDashaModelImpl value,
          $Res Function(_$VimshottariDashaModelImpl) then) =
      __$$VimshottariDashaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String time, VimMahaDashaModel maha_dasha});

  @override
  $VimMahaDashaModelCopyWith<$Res> get maha_dasha;
}

/// @nodoc
class __$$VimshottariDashaModelImplCopyWithImpl<$Res>
    extends _$VimshottariDashaModelCopyWithImpl<$Res,
        _$VimshottariDashaModelImpl>
    implements _$$VimshottariDashaModelImplCopyWith<$Res> {
  __$$VimshottariDashaModelImplCopyWithImpl(_$VimshottariDashaModelImpl _value,
      $Res Function(_$VimshottariDashaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? time = null,
    Object? maha_dasha = null,
  }) {
    return _then(_$VimshottariDashaModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      maha_dasha: null == maha_dasha
          ? _value.maha_dasha
          : maha_dasha // ignore: cast_nullable_to_non_nullable
              as VimMahaDashaModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VimshottariDashaModelImpl implements _VimshottariDashaModel {
  _$VimshottariDashaModelImpl(
      {required this.date, required this.time, required this.maha_dasha});

  factory _$VimshottariDashaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VimshottariDashaModelImplFromJson(json);

  @override
  final String date;
  @override
  final String time;
  @override
  final VimMahaDashaModel maha_dasha;

  @override
  String toString() {
    return 'VimshottariDashaModel(date: $date, time: $time, maha_dasha: $maha_dasha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VimshottariDashaModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.maha_dasha, maha_dasha) ||
                other.maha_dasha == maha_dasha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, time, maha_dasha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VimshottariDashaModelImplCopyWith<_$VimshottariDashaModelImpl>
      get copyWith => __$$VimshottariDashaModelImplCopyWithImpl<
          _$VimshottariDashaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VimshottariDashaModelImplToJson(
      this,
    );
  }
}

abstract class _VimshottariDashaModel implements VimshottariDashaModel {
  factory _VimshottariDashaModel(
          {required final String date,
          required final String time,
          required final VimMahaDashaModel maha_dasha}) =
      _$VimshottariDashaModelImpl;

  factory _VimshottariDashaModel.fromJson(Map<String, dynamic> json) =
      _$VimshottariDashaModelImpl.fromJson;

  @override
  String get date;
  @override
  String get time;
  @override
  VimMahaDashaModel get maha_dasha;
  @override
  @JsonKey(ignore: true)
  _$$VimshottariDashaModelImplCopyWith<_$VimshottariDashaModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
