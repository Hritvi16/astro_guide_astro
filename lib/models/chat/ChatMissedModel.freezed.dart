// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatMissedModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMissedModel _$ChatMissedModelFromJson(Map<String, dynamic> json) {
  return _ChatMissedModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMissedModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get ch_id => throw _privateConstructorUsedError;
  SessionHistoryModel? get data => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMissedModelCopyWith<ChatMissedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMissedModelCopyWith<$Res> {
  factory $ChatMissedModelCopyWith(
          ChatMissedModel value, $Res Function(ChatMissedModel) then) =
      _$ChatMissedModelCopyWithImpl<$Res, ChatMissedModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int ch_id,
      SessionHistoryModel? data,
      double? wallet,
      UserModel? user});

  $SessionHistoryModelCopyWith<$Res>? get data;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ChatMissedModelCopyWithImpl<$Res, $Val extends ChatMissedModel>
    implements $ChatMissedModelCopyWith<$Res> {
  _$ChatMissedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? ch_id = null,
    Object? data = freezed,
    Object? wallet = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ch_id: null == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SessionHistoryModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMissedModelImplCopyWith<$Res>
    implements $ChatMissedModelCopyWith<$Res> {
  factory _$$ChatMissedModelImplCopyWith(_$ChatMissedModelImpl value,
          $Res Function(_$ChatMissedModelImpl) then) =
      __$$ChatMissedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int ch_id,
      SessionHistoryModel? data,
      double? wallet,
      UserModel? user});

  @override
  $SessionHistoryModelCopyWith<$Res>? get data;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ChatMissedModelImplCopyWithImpl<$Res>
    extends _$ChatMissedModelCopyWithImpl<$Res, _$ChatMissedModelImpl>
    implements _$$ChatMissedModelImplCopyWith<$Res> {
  __$$ChatMissedModelImplCopyWithImpl(
      _$ChatMissedModelImpl _value, $Res Function(_$ChatMissedModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? ch_id = null,
    Object? data = freezed,
    Object? wallet = freezed,
    Object? user = freezed,
  }) {
    return _then(_$ChatMissedModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      ch_id: null == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMissedModelImpl implements _ChatMissedModel {
  _$ChatMissedModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      required this.ch_id,
      this.data,
      this.wallet,
      this.user});

  factory _$ChatMissedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMissedModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int ch_id;
  @override
  final SessionHistoryModel? data;
  @override
  final double? wallet;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'ChatMissedModel(status: $status, code: $code, message: $message, ch_id: $ch_id, data: $data, wallet: $wallet, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMissedModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ch_id, ch_id) || other.ch_id == ch_id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, code, message, ch_id, data, wallet, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMissedModelImplCopyWith<_$ChatMissedModelImpl> get copyWith =>
      __$$ChatMissedModelImplCopyWithImpl<_$ChatMissedModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMissedModelImplToJson(
      this,
    );
  }
}

abstract class _ChatMissedModel implements ChatMissedModel {
  factory _ChatMissedModel(
      {required final String status,
      required final int code,
      required final String message,
      required final int ch_id,
      final SessionHistoryModel? data,
      final double? wallet,
      final UserModel? user}) = _$ChatMissedModelImpl;

  factory _ChatMissedModel.fromJson(Map<String, dynamic> json) =
      _$ChatMissedModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int get ch_id;
  @override
  SessionHistoryModel? get data;
  @override
  double? get wallet;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$ChatMissedModelImplCopyWith<_$ChatMissedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
