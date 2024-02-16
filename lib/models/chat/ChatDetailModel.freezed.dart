// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatDetailModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatDetailModel _$ChatDetailModelFromJson(Map<String, dynamic> json) {
  return _ChatDetailModel.fromJson(json);
}

/// @nodoc
mixin _$ChatDetailModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ChatModel>? get data => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  SessionHistoryModel? get session_history =>
      throw _privateConstructorUsedError;
  ReviewModel? get review => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDetailModelCopyWith<ChatDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDetailModelCopyWith<$Res> {
  factory $ChatDetailModelCopyWith(
          ChatDetailModel value, $Res Function(ChatDetailModel) then) =
      _$ChatDetailModelCopyWithImpl<$Res, ChatDetailModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ChatModel>? data,
      UserModel? user,
      SessionHistoryModel? session_history,
      ReviewModel? review,
      double? wallet});

  $UserModelCopyWith<$Res>? get user;
  $SessionHistoryModelCopyWith<$Res>? get session_history;
  $ReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class _$ChatDetailModelCopyWithImpl<$Res, $Val extends ChatDetailModel>
    implements $ChatDetailModelCopyWith<$Res> {
  _$ChatDetailModelCopyWithImpl(this._value, this._then);

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
    Object? data = freezed,
    Object? user = freezed,
    Object? session_history = freezed,
    Object? review = freezed,
    Object? wallet = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryModelCopyWith<$Res>? get session_history {
    if (_value.session_history == null) {
      return null;
    }

    return $SessionHistoryModelCopyWith<$Res>(_value.session_history!, (value) {
      return _then(_value.copyWith(session_history: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<$Res>? get review {
    if (_value.review == null) {
      return null;
    }

    return $ReviewModelCopyWith<$Res>(_value.review!, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatDetailModelImplCopyWith<$Res>
    implements $ChatDetailModelCopyWith<$Res> {
  factory _$$ChatDetailModelImplCopyWith(_$ChatDetailModelImpl value,
          $Res Function(_$ChatDetailModelImpl) then) =
      __$$ChatDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ChatModel>? data,
      UserModel? user,
      SessionHistoryModel? session_history,
      ReviewModel? review,
      double? wallet});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $SessionHistoryModelCopyWith<$Res>? get session_history;
  @override
  $ReviewModelCopyWith<$Res>? get review;
}

/// @nodoc
class __$$ChatDetailModelImplCopyWithImpl<$Res>
    extends _$ChatDetailModelCopyWithImpl<$Res, _$ChatDetailModelImpl>
    implements _$$ChatDetailModelImplCopyWith<$Res> {
  __$$ChatDetailModelImplCopyWithImpl(
      _$ChatDetailModelImpl _value, $Res Function(_$ChatDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? user = freezed,
    Object? session_history = freezed,
    Object? review = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$ChatDetailModelImpl(
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
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as ReviewModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDetailModelImpl implements _ChatDetailModel {
  _$ChatDetailModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<ChatModel>? data,
      this.user,
      this.session_history,
      this.review,
      this.wallet})
      : _data = data;

  factory _$ChatDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDetailModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<ChatModel>? _data;
  @override
  List<ChatModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel? user;
  @override
  final SessionHistoryModel? session_history;
  @override
  final ReviewModel? review;
  @override
  final double? wallet;

  @override
  String toString() {
    return 'ChatDetailModel(status: $status, code: $code, message: $message, data: $data, user: $user, session_history: $session_history, review: $review, wallet: $wallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDetailModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.session_history, session_history) ||
                other.session_history == session_history) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_data),
      user,
      session_history,
      review,
      wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDetailModelImplCopyWith<_$ChatDetailModelImpl> get copyWith =>
      __$$ChatDetailModelImplCopyWithImpl<_$ChatDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDetailModelImplToJson(
      this,
    );
  }
}

abstract class _ChatDetailModel implements ChatDetailModel {
  factory _ChatDetailModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<ChatModel>? data,
      final UserModel? user,
      final SessionHistoryModel? session_history,
      final ReviewModel? review,
      final double? wallet}) = _$ChatDetailModelImpl;

  factory _ChatDetailModel.fromJson(Map<String, dynamic> json) =
      _$ChatDetailModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<ChatModel>? get data;
  @override
  UserModel? get user;
  @override
  SessionHistoryModel? get session_history;
  @override
  ReviewModel? get review;
  @override
  double? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$ChatDetailModelImplCopyWith<_$ChatDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
