// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CheckChatModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckChatModel _$CheckChatModelFromJson(Map<String, dynamic> json) {
  return _CheckChatModel.fromJson(json);
}

/// @nodoc
mixin _$CheckChatModel {
  String get name => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  int? get ci_id => throw _privateConstructorUsedError;
  String? get marital_status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckChatModelCopyWith<CheckChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckChatModelCopyWith<$Res> {
  factory $CheckChatModelCopyWith(
          CheckChatModel value, $Res Function(CheckChatModel) then) =
      _$CheckChatModelCopyWithImpl<$Res, CheckChatModel>;
  @useResult
  $Res call(
      {String name,
      String mobile,
      String gender,
      String dob,
      int? ci_id,
      String? marital_status,
      String? type,
      String info});
}

/// @nodoc
class _$CheckChatModelCopyWithImpl<$Res, $Val extends CheckChatModel>
    implements $CheckChatModelCopyWith<$Res> {
  _$CheckChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mobile = null,
    Object? gender = null,
    Object? dob = null,
    Object? ci_id = freezed,
    Object? marital_status = freezed,
    Object? type = freezed,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      ci_id: freezed == ci_id
          ? _value.ci_id
          : ci_id // ignore: cast_nullable_to_non_nullable
              as int?,
      marital_status: freezed == marital_status
          ? _value.marital_status
          : marital_status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckChatModelCopyWith<$Res>
    implements $CheckChatModelCopyWith<$Res> {
  factory _$$_CheckChatModelCopyWith(
          _$_CheckChatModel value, $Res Function(_$_CheckChatModel) then) =
      __$$_CheckChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String mobile,
      String gender,
      String dob,
      int? ci_id,
      String? marital_status,
      String? type,
      String info});
}

/// @nodoc
class __$$_CheckChatModelCopyWithImpl<$Res>
    extends _$CheckChatModelCopyWithImpl<$Res, _$_CheckChatModel>
    implements _$$_CheckChatModelCopyWith<$Res> {
  __$$_CheckChatModelCopyWithImpl(
      _$_CheckChatModel _value, $Res Function(_$_CheckChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mobile = null,
    Object? gender = null,
    Object? dob = null,
    Object? ci_id = freezed,
    Object? marital_status = freezed,
    Object? type = freezed,
    Object? info = null,
  }) {
    return _then(_$_CheckChatModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      ci_id: freezed == ci_id
          ? _value.ci_id
          : ci_id // ignore: cast_nullable_to_non_nullable
              as int?,
      marital_status: freezed == marital_status
          ? _value.marital_status
          : marital_status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckChatModel implements _CheckChatModel {
  _$_CheckChatModel(
      {required this.name,
      required this.mobile,
      required this.gender,
      required this.dob,
      this.ci_id,
      this.marital_status,
      this.type,
      required this.info});

  factory _$_CheckChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckChatModelFromJson(json);

  @override
  final String name;
  @override
  final String mobile;
  @override
  final String gender;
  @override
  final String dob;
  @override
  final int? ci_id;
  @override
  final String? marital_status;
  @override
  final String? type;
  @override
  final String info;

  @override
  String toString() {
    return 'CheckChatModel(name: $name, mobile: $mobile, gender: $gender, dob: $dob, ci_id: $ci_id, marital_status: $marital_status, type: $type, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckChatModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.ci_id, ci_id) || other.ci_id == ci_id) &&
            (identical(other.marital_status, marital_status) ||
                other.marital_status == marital_status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, mobile, gender, dob, ci_id,
      marital_status, type, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckChatModelCopyWith<_$_CheckChatModel> get copyWith =>
      __$$_CheckChatModelCopyWithImpl<_$_CheckChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckChatModelToJson(
      this,
    );
  }
}

abstract class _CheckChatModel implements CheckChatModel {
  factory _CheckChatModel(
      {required final String name,
      required final String mobile,
      required final String gender,
      required final String dob,
      final int? ci_id,
      final String? marital_status,
      final String? type,
      required final String info}) = _$_CheckChatModel;

  factory _CheckChatModel.fromJson(Map<String, dynamic> json) =
      _$_CheckChatModel.fromJson;

  @override
  String get name;
  @override
  String get mobile;
  @override
  String get gender;
  @override
  String get dob;
  @override
  int? get ci_id;
  @override
  String? get marital_status;
  @override
  String? get type;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_CheckChatModelCopyWith<_$_CheckChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
