// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BasicReportModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BasicReportModel _$BasicReportModelFromJson(Map<String, dynamic> json) {
  return _BasicReportModel.fromJson(json);
}

/// @nodoc
mixin _$BasicReportModel {
  String get month => throw _privateConstructorUsedError;
  int get total_chat_sec => throw _privateConstructorUsedError;
  int get total_call_sec => throw _privateConstructorUsedError;
  int get total_chat => throw _privateConstructorUsedError;
  int get total_call => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicReportModelCopyWith<BasicReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicReportModelCopyWith<$Res> {
  factory $BasicReportModelCopyWith(
          BasicReportModel value, $Res Function(BasicReportModel) then) =
      _$BasicReportModelCopyWithImpl<$Res, BasicReportModel>;
  @useResult
  $Res call(
      {String month,
      int total_chat_sec,
      int total_call_sec,
      int total_chat,
      int total_call});
}

/// @nodoc
class _$BasicReportModelCopyWithImpl<$Res, $Val extends BasicReportModel>
    implements $BasicReportModelCopyWith<$Res> {
  _$BasicReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? total_chat_sec = null,
    Object? total_call_sec = null,
    Object? total_chat = null,
    Object? total_call = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      total_chat_sec: null == total_chat_sec
          ? _value.total_chat_sec
          : total_chat_sec // ignore: cast_nullable_to_non_nullable
              as int,
      total_call_sec: null == total_call_sec
          ? _value.total_call_sec
          : total_call_sec // ignore: cast_nullable_to_non_nullable
              as int,
      total_chat: null == total_chat
          ? _value.total_chat
          : total_chat // ignore: cast_nullable_to_non_nullable
              as int,
      total_call: null == total_call
          ? _value.total_call
          : total_call // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicReportModelImplCopyWith<$Res>
    implements $BasicReportModelCopyWith<$Res> {
  factory _$$BasicReportModelImplCopyWith(_$BasicReportModelImpl value,
          $Res Function(_$BasicReportModelImpl) then) =
      __$$BasicReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String month,
      int total_chat_sec,
      int total_call_sec,
      int total_chat,
      int total_call});
}

/// @nodoc
class __$$BasicReportModelImplCopyWithImpl<$Res>
    extends _$BasicReportModelCopyWithImpl<$Res, _$BasicReportModelImpl>
    implements _$$BasicReportModelImplCopyWith<$Res> {
  __$$BasicReportModelImplCopyWithImpl(_$BasicReportModelImpl _value,
      $Res Function(_$BasicReportModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? total_chat_sec = null,
    Object? total_call_sec = null,
    Object? total_chat = null,
    Object? total_call = null,
  }) {
    return _then(_$BasicReportModelImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      total_chat_sec: null == total_chat_sec
          ? _value.total_chat_sec
          : total_chat_sec // ignore: cast_nullable_to_non_nullable
              as int,
      total_call_sec: null == total_call_sec
          ? _value.total_call_sec
          : total_call_sec // ignore: cast_nullable_to_non_nullable
              as int,
      total_chat: null == total_chat
          ? _value.total_chat
          : total_chat // ignore: cast_nullable_to_non_nullable
              as int,
      total_call: null == total_call
          ? _value.total_call
          : total_call // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicReportModelImpl implements _BasicReportModel {
  _$BasicReportModelImpl(
      {required this.month,
      required this.total_chat_sec,
      required this.total_call_sec,
      required this.total_chat,
      required this.total_call});

  factory _$BasicReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicReportModelImplFromJson(json);

  @override
  final String month;
  @override
  final int total_chat_sec;
  @override
  final int total_call_sec;
  @override
  final int total_chat;
  @override
  final int total_call;

  @override
  String toString() {
    return 'BasicReportModel(month: $month, total_chat_sec: $total_chat_sec, total_call_sec: $total_call_sec, total_chat: $total_chat, total_call: $total_call)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicReportModelImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.total_chat_sec, total_chat_sec) ||
                other.total_chat_sec == total_chat_sec) &&
            (identical(other.total_call_sec, total_call_sec) ||
                other.total_call_sec == total_call_sec) &&
            (identical(other.total_chat, total_chat) ||
                other.total_chat == total_chat) &&
            (identical(other.total_call, total_call) ||
                other.total_call == total_call));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, total_chat_sec,
      total_call_sec, total_chat, total_call);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicReportModelImplCopyWith<_$BasicReportModelImpl> get copyWith =>
      __$$BasicReportModelImplCopyWithImpl<_$BasicReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicReportModelImplToJson(
      this,
    );
  }
}

abstract class _BasicReportModel implements BasicReportModel {
  factory _BasicReportModel(
      {required final String month,
      required final int total_chat_sec,
      required final int total_call_sec,
      required final int total_chat,
      required final int total_call}) = _$BasicReportModelImpl;

  factory _BasicReportModel.fromJson(Map<String, dynamic> json) =
      _$BasicReportModelImpl.fromJson;

  @override
  String get month;
  @override
  int get total_chat_sec;
  @override
  int get total_call_sec;
  @override
  int get total_chat;
  @override
  int get total_call;
  @override
  @JsonKey(ignore: true)
  _$$BasicReportModelImplCopyWith<_$BasicReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
