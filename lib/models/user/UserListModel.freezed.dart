// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserListModel _$UserListModelFromJson(Map<String, dynamic> json) {
  return _UserListModel.fromJson(json);
}

/// @nodoc
mixin _$UserListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<UserModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListModelCopyWith<UserListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListModelCopyWith<$Res> {
  factory $UserListModelCopyWith(
          UserListModel value, $Res Function(UserListModel) then) =
      _$UserListModelCopyWithImpl<$Res, UserListModel>;
  @useResult
  $Res call({String status, int code, String message, List<UserModel>? data});
}

/// @nodoc
class _$UserListModelCopyWithImpl<$Res, $Val extends UserListModel>
    implements $UserListModelCopyWith<$Res> {
  _$UserListModelCopyWithImpl(this._value, this._then);

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
              as List<UserModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserListModelImplCopyWith<$Res>
    implements $UserListModelCopyWith<$Res> {
  factory _$$UserListModelImplCopyWith(
          _$UserListModelImpl value, $Res Function(_$UserListModelImpl) then) =
      __$$UserListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<UserModel>? data});
}

/// @nodoc
class __$$UserListModelImplCopyWithImpl<$Res>
    extends _$UserListModelCopyWithImpl<$Res, _$UserListModelImpl>
    implements _$$UserListModelImplCopyWith<$Res> {
  __$$UserListModelImplCopyWithImpl(
      _$UserListModelImpl _value, $Res Function(_$UserListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$UserListModelImpl(
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
              as List<UserModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserListModelImpl implements _UserListModel {
  _$UserListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<UserModel>? data})
      : _data = data;

  factory _$UserListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<UserModel>? _data;
  @override
  List<UserModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListModelImpl &&
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
  _$$UserListModelImplCopyWith<_$UserListModelImpl> get copyWith =>
      __$$UserListModelImplCopyWithImpl<_$UserListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserListModelImplToJson(
      this,
    );
  }
}

abstract class _UserListModel implements UserListModel {
  factory _UserListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<UserModel>? data}) = _$UserListModelImpl;

  factory _UserListModel.fromJson(Map<String, dynamic> json) =
      _$UserListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<UserModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$UserListModelImplCopyWith<_$UserListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
