// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BankModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankModel _$BankModelFromJson(Map<String, dynamic> json) {
  return _BankModel.fromJson(json);
}

/// @nodoc
mixin _$BankModel {
  int get id => throw _privateConstructorUsedError;
  int get astro_id => throw _privateConstructorUsedError;
  String get bank_name => throw _privateConstructorUsedError;
  String get branch => throw _privateConstructorUsedError;
  String get holder_name => throw _privateConstructorUsedError;
  String get account_no => throw _privateConstructorUsedError;
  String get ifsc => throw _privateConstructorUsedError;
  String get cheque => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  String? get verified_at => throw _privateConstructorUsedError;
  int? get verified_by => throw _privateConstructorUsedError;
  int get verified => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankModelCopyWith<BankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankModelCopyWith<$Res> {
  factory $BankModelCopyWith(BankModel value, $Res Function(BankModel) then) =
      _$BankModelCopyWithImpl<$Res, BankModel>;
  @useResult
  $Res call(
      {int id,
      int astro_id,
      String bank_name,
      String branch,
      String holder_name,
      String account_no,
      String ifsc,
      String cheque,
      String created_at,
      String? updated_at,
      String? verified_at,
      int? verified_by,
      int verified,
      int status});
}

/// @nodoc
class _$BankModelCopyWithImpl<$Res, $Val extends BankModel>
    implements $BankModelCopyWith<$Res> {
  _$BankModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? astro_id = null,
    Object? bank_name = null,
    Object? branch = null,
    Object? holder_name = null,
    Object? account_no = null,
    Object? ifsc = null,
    Object? cheque = null,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? verified_at = freezed,
    Object? verified_by = freezed,
    Object? verified = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      astro_id: null == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_name: null == bank_name
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      holder_name: null == holder_name
          ? _value.holder_name
          : holder_name // ignore: cast_nullable_to_non_nullable
              as String,
      account_no: null == account_no
          ? _value.account_no
          : account_no // ignore: cast_nullable_to_non_nullable
              as String,
      ifsc: null == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String,
      cheque: null == cheque
          ? _value.cheque
          : cheque // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_at: freezed == verified_at
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankModelImplCopyWith<$Res>
    implements $BankModelCopyWith<$Res> {
  factory _$$BankModelImplCopyWith(
          _$BankModelImpl value, $Res Function(_$BankModelImpl) then) =
      __$$BankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int astro_id,
      String bank_name,
      String branch,
      String holder_name,
      String account_no,
      String ifsc,
      String cheque,
      String created_at,
      String? updated_at,
      String? verified_at,
      int? verified_by,
      int verified,
      int status});
}

/// @nodoc
class __$$BankModelImplCopyWithImpl<$Res>
    extends _$BankModelCopyWithImpl<$Res, _$BankModelImpl>
    implements _$$BankModelImplCopyWith<$Res> {
  __$$BankModelImplCopyWithImpl(
      _$BankModelImpl _value, $Res Function(_$BankModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? astro_id = null,
    Object? bank_name = null,
    Object? branch = null,
    Object? holder_name = null,
    Object? account_no = null,
    Object? ifsc = null,
    Object? cheque = null,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? verified_at = freezed,
    Object? verified_by = freezed,
    Object? verified = null,
    Object? status = null,
  }) {
    return _then(_$BankModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      astro_id: null == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_name: null == bank_name
          ? _value.bank_name
          : bank_name // ignore: cast_nullable_to_non_nullable
              as String,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as String,
      holder_name: null == holder_name
          ? _value.holder_name
          : holder_name // ignore: cast_nullable_to_non_nullable
              as String,
      account_no: null == account_no
          ? _value.account_no
          : account_no // ignore: cast_nullable_to_non_nullable
              as String,
      ifsc: null == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String,
      cheque: null == cheque
          ? _value.cheque
          : cheque // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_at: freezed == verified_at
          ? _value.verified_at
          : verified_at // ignore: cast_nullable_to_non_nullable
              as String?,
      verified_by: freezed == verified_by
          ? _value.verified_by
          : verified_by // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankModelImpl implements _BankModel {
  _$BankModelImpl(
      {required this.id,
      required this.astro_id,
      required this.bank_name,
      required this.branch,
      required this.holder_name,
      required this.account_no,
      required this.ifsc,
      required this.cheque,
      required this.created_at,
      this.updated_at,
      this.verified_at,
      this.verified_by,
      required this.verified,
      required this.status});

  factory _$BankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankModelImplFromJson(json);

  @override
  final int id;
  @override
  final int astro_id;
  @override
  final String bank_name;
  @override
  final String branch;
  @override
  final String holder_name;
  @override
  final String account_no;
  @override
  final String ifsc;
  @override
  final String cheque;
  @override
  final String created_at;
  @override
  final String? updated_at;
  @override
  final String? verified_at;
  @override
  final int? verified_by;
  @override
  final int verified;
  @override
  final int status;

  @override
  String toString() {
    return 'BankModel(id: $id, astro_id: $astro_id, bank_name: $bank_name, branch: $branch, holder_name: $holder_name, account_no: $account_no, ifsc: $ifsc, cheque: $cheque, created_at: $created_at, updated_at: $updated_at, verified_at: $verified_at, verified_by: $verified_by, verified: $verified, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.astro_id, astro_id) ||
                other.astro_id == astro_id) &&
            (identical(other.bank_name, bank_name) ||
                other.bank_name == bank_name) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.holder_name, holder_name) ||
                other.holder_name == holder_name) &&
            (identical(other.account_no, account_no) ||
                other.account_no == account_no) &&
            (identical(other.ifsc, ifsc) || other.ifsc == ifsc) &&
            (identical(other.cheque, cheque) || other.cheque == cheque) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.verified_at, verified_at) ||
                other.verified_at == verified_at) &&
            (identical(other.verified_by, verified_by) ||
                other.verified_by == verified_by) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      astro_id,
      bank_name,
      branch,
      holder_name,
      account_no,
      ifsc,
      cheque,
      created_at,
      updated_at,
      verified_at,
      verified_by,
      verified,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      __$$BankModelImplCopyWithImpl<_$BankModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankModelImplToJson(
      this,
    );
  }
}

abstract class _BankModel implements BankModel {
  factory _BankModel(
      {required final int id,
      required final int astro_id,
      required final String bank_name,
      required final String branch,
      required final String holder_name,
      required final String account_no,
      required final String ifsc,
      required final String cheque,
      required final String created_at,
      final String? updated_at,
      final String? verified_at,
      final int? verified_by,
      required final int verified,
      required final int status}) = _$BankModelImpl;

  factory _BankModel.fromJson(Map<String, dynamic> json) =
      _$BankModelImpl.fromJson;

  @override
  int get id;
  @override
  int get astro_id;
  @override
  String get bank_name;
  @override
  String get branch;
  @override
  String get holder_name;
  @override
  String get account_no;
  @override
  String get ifsc;
  @override
  String get cheque;
  @override
  String get created_at;
  @override
  String? get updated_at;
  @override
  String? get verified_at;
  @override
  int? get verified_by;
  @override
  int get verified;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$BankModelImplCopyWith<_$BankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
