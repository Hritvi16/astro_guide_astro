// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'EndChatResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EndChatResponseModel _$EndChatResponseModelFromJson(Map<String, dynamic> json) {
  return _EndChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$EndChatResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get seconds => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get chat_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndChatResponseModelCopyWith<EndChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndChatResponseModelCopyWith<$Res> {
  factory $EndChatResponseModelCopyWith(EndChatResponseModel value,
          $Res Function(EndChatResponseModel) then) =
      _$EndChatResponseModelCopyWithImpl<$Res, EndChatResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? seconds,
      double? amount,
      String? chat_type});
}

/// @nodoc
class _$EndChatResponseModelCopyWithImpl<$Res,
        $Val extends EndChatResponseModel>
    implements $EndChatResponseModelCopyWith<$Res> {
  _$EndChatResponseModelCopyWithImpl(this._value, this._then);

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
    Object? seconds = freezed,
    Object? amount = freezed,
    Object? chat_type = freezed,
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
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      chat_type: freezed == chat_type
          ? _value.chat_type
          : chat_type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndChatResponseModelImplCopyWith<$Res>
    implements $EndChatResponseModelCopyWith<$Res> {
  factory _$$EndChatResponseModelImplCopyWith(_$EndChatResponseModelImpl value,
          $Res Function(_$EndChatResponseModelImpl) then) =
      __$$EndChatResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? seconds,
      double? amount,
      String? chat_type});
}

/// @nodoc
class __$$EndChatResponseModelImplCopyWithImpl<$Res>
    extends _$EndChatResponseModelCopyWithImpl<$Res, _$EndChatResponseModelImpl>
    implements _$$EndChatResponseModelImplCopyWith<$Res> {
  __$$EndChatResponseModelImplCopyWithImpl(_$EndChatResponseModelImpl _value,
      $Res Function(_$EndChatResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? seconds = freezed,
    Object? amount = freezed,
    Object? chat_type = freezed,
  }) {
    return _then(_$EndChatResponseModelImpl(
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
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      chat_type: freezed == chat_type
          ? _value.chat_type
          : chat_type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EndChatResponseModelImpl implements _EndChatResponseModel {
  _$EndChatResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.seconds,
      this.amount,
      this.chat_type});

  factory _$EndChatResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndChatResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int? seconds;
  @override
  final double? amount;
  @override
  final String? chat_type;

  @override
  String toString() {
    return 'EndChatResponseModel(status: $status, code: $code, message: $message, seconds: $seconds, amount: $amount, chat_type: $chat_type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndChatResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.chat_type, chat_type) ||
                other.chat_type == chat_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, code, message, seconds, amount, chat_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EndChatResponseModelImplCopyWith<_$EndChatResponseModelImpl>
      get copyWith =>
          __$$EndChatResponseModelImplCopyWithImpl<_$EndChatResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EndChatResponseModelImplToJson(
      this,
    );
  }
}

abstract class _EndChatResponseModel implements EndChatResponseModel {
  factory _EndChatResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final int? seconds,
      final double? amount,
      final String? chat_type}) = _$EndChatResponseModelImpl;

  factory _EndChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$EndChatResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int? get seconds;
  @override
  double? get amount;
  @override
  String? get chat_type;
  @override
  @JsonKey(ignore: true)
  _$$EndChatResponseModelImplCopyWith<_$EndChatResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
