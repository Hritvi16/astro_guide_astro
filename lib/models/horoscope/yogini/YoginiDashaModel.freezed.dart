// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'YoginiDashaModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YoginiDashaModel _$YoginiDashaModelFromJson(Map<String, dynamic> json) {
  return _YoginiDashaModel.fromJson(json);
}

/// @nodoc
mixin _$YoginiDashaModel {
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  List<YogMahaDashaModel> get maha_dasha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YoginiDashaModelCopyWith<YoginiDashaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoginiDashaModelCopyWith<$Res> {
  factory $YoginiDashaModelCopyWith(
          YoginiDashaModel value, $Res Function(YoginiDashaModel) then) =
      _$YoginiDashaModelCopyWithImpl<$Res, YoginiDashaModel>;
  @useResult
  $Res call({String date, String time, List<YogMahaDashaModel> maha_dasha});
}

/// @nodoc
class _$YoginiDashaModelCopyWithImpl<$Res, $Val extends YoginiDashaModel>
    implements $YoginiDashaModelCopyWith<$Res> {
  _$YoginiDashaModelCopyWithImpl(this._value, this._then);

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
              as List<YogMahaDashaModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YoginiDashaModelImplCopyWith<$Res>
    implements $YoginiDashaModelCopyWith<$Res> {
  factory _$$YoginiDashaModelImplCopyWith(_$YoginiDashaModelImpl value,
          $Res Function(_$YoginiDashaModelImpl) then) =
      __$$YoginiDashaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, String time, List<YogMahaDashaModel> maha_dasha});
}

/// @nodoc
class __$$YoginiDashaModelImplCopyWithImpl<$Res>
    extends _$YoginiDashaModelCopyWithImpl<$Res, _$YoginiDashaModelImpl>
    implements _$$YoginiDashaModelImplCopyWith<$Res> {
  __$$YoginiDashaModelImplCopyWithImpl(_$YoginiDashaModelImpl _value,
      $Res Function(_$YoginiDashaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? time = null,
    Object? maha_dasha = null,
  }) {
    return _then(_$YoginiDashaModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      maha_dasha: null == maha_dasha
          ? _value._maha_dasha
          : maha_dasha // ignore: cast_nullable_to_non_nullable
              as List<YogMahaDashaModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YoginiDashaModelImpl implements _YoginiDashaModel {
  _$YoginiDashaModelImpl(
      {required this.date,
      required this.time,
      required final List<YogMahaDashaModel> maha_dasha})
      : _maha_dasha = maha_dasha;

  factory _$YoginiDashaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoginiDashaModelImplFromJson(json);

  @override
  final String date;
  @override
  final String time;
  final List<YogMahaDashaModel> _maha_dasha;
  @override
  List<YogMahaDashaModel> get maha_dasha {
    if (_maha_dasha is EqualUnmodifiableListView) return _maha_dasha;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_maha_dasha);
  }

  @override
  String toString() {
    return 'YoginiDashaModel(date: $date, time: $time, maha_dasha: $maha_dasha)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoginiDashaModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality()
                .equals(other._maha_dasha, _maha_dasha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, time,
      const DeepCollectionEquality().hash(_maha_dasha));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YoginiDashaModelImplCopyWith<_$YoginiDashaModelImpl> get copyWith =>
      __$$YoginiDashaModelImplCopyWithImpl<_$YoginiDashaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YoginiDashaModelImplToJson(
      this,
    );
  }
}

abstract class _YoginiDashaModel implements YoginiDashaModel {
  factory _YoginiDashaModel(
          {required final String date,
          required final String time,
          required final List<YogMahaDashaModel> maha_dasha}) =
      _$YoginiDashaModelImpl;

  factory _YoginiDashaModel.fromJson(Map<String, dynamic> json) =
      _$YoginiDashaModelImpl.fromJson;

  @override
  String get date;
  @override
  String get time;
  @override
  List<YogMahaDashaModel> get maha_dasha;
  @override
  @JsonKey(ignore: true)
  _$$YoginiDashaModelImplCopyWith<_$YoginiDashaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
