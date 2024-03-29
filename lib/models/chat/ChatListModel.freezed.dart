// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatListModel _$ChatListModelFromJson(Map<String, dynamic> json) {
  return _ChatListModel.fromJson(json);
}

/// @nodoc
mixin _$ChatListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ChatHistoryModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatListModelCopyWith<ChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListModelCopyWith<$Res> {
  factory $ChatListModelCopyWith(
          ChatListModel value, $Res Function(ChatListModel) then) =
      _$ChatListModelCopyWithImpl<$Res, ChatListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<ChatHistoryModel>? data});
}

/// @nodoc
class _$ChatListModelCopyWithImpl<$Res, $Val extends ChatListModel>
    implements $ChatListModelCopyWith<$Res> {
  _$ChatListModelCopyWithImpl(this._value, this._then);

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
              as List<ChatHistoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatListModelImplCopyWith<$Res>
    implements $ChatListModelCopyWith<$Res> {
  factory _$$ChatListModelImplCopyWith(
          _$ChatListModelImpl value, $Res Function(_$ChatListModelImpl) then) =
      __$$ChatListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<ChatHistoryModel>? data});
}

/// @nodoc
class __$$ChatListModelImplCopyWithImpl<$Res>
    extends _$ChatListModelCopyWithImpl<$Res, _$ChatListModelImpl>
    implements _$$ChatListModelImplCopyWith<$Res> {
  __$$ChatListModelImplCopyWithImpl(
      _$ChatListModelImpl _value, $Res Function(_$ChatListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ChatListModelImpl(
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
              as List<ChatHistoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListModelImpl implements _ChatListModel {
  _$ChatListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<ChatHistoryModel>? data})
      : _data = data;

  factory _$ChatListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<ChatHistoryModel>? _data;
  @override
  List<ChatHistoryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListModelImplCopyWith<_$ChatListModelImpl> get copyWith =>
      __$$ChatListModelImplCopyWithImpl<_$ChatListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListModelImplToJson(
      this,
    );
  }
}

abstract class _ChatListModel implements ChatListModel {
  factory _ChatListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<ChatHistoryModel>? data}) = _$ChatListModelImpl;

  factory _ChatListModel.fromJson(Map<String, dynamic> json) =
      _$ChatListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<ChatHistoryModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ChatListModelImplCopyWith<_$ChatListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
