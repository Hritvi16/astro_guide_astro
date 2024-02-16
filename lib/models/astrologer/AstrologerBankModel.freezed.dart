// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerBankModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AstrologerBankModel _$AstrologerBankModelFromJson(Map<String, dynamic> json) {
  return _AstrologerBankModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerBankModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BankModel? get data => throw _privateConstructorUsedError;
  List<BankModel>? get history => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerBankModelCopyWith<AstrologerBankModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerBankModelCopyWith<$Res> {
  factory $AstrologerBankModelCopyWith(
          AstrologerBankModel value, $Res Function(AstrologerBankModel) then) =
      _$AstrologerBankModelCopyWithImpl<$Res, AstrologerBankModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      BankModel? data,
      List<BankModel>? history});

  $BankModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$AstrologerBankModelCopyWithImpl<$Res, $Val extends AstrologerBankModel>
    implements $AstrologerBankModelCopyWith<$Res> {
  _$AstrologerBankModelCopyWithImpl(this._value, this._then);

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
    Object? history = freezed,
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
              as BankModel?,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<BankModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BankModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AstrologerBankModelImplCopyWith<$Res>
    implements $AstrologerBankModelCopyWith<$Res> {
  factory _$$AstrologerBankModelImplCopyWith(_$AstrologerBankModelImpl value,
          $Res Function(_$AstrologerBankModelImpl) then) =
      __$$AstrologerBankModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      BankModel? data,
      List<BankModel>? history});

  @override
  $BankModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AstrologerBankModelImplCopyWithImpl<$Res>
    extends _$AstrologerBankModelCopyWithImpl<$Res, _$AstrologerBankModelImpl>
    implements _$$AstrologerBankModelImplCopyWith<$Res> {
  __$$AstrologerBankModelImplCopyWithImpl(_$AstrologerBankModelImpl _value,
      $Res Function(_$AstrologerBankModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? history = freezed,
  }) {
    return _then(_$AstrologerBankModelImpl(
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
              as BankModel?,
      history: freezed == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<BankModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerBankModelImpl implements _AstrologerBankModel {
  _$AstrologerBankModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      final List<BankModel>? history})
      : _history = history;

  factory _$AstrologerBankModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerBankModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final BankModel? data;
  final List<BankModel>? _history;
  @override
  List<BankModel>? get history {
    final value = _history;
    if (value == null) return null;
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerBankModel(status: $status, code: $code, message: $message, data: $data, history: $history)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerBankModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, data,
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstrologerBankModelImplCopyWith<_$AstrologerBankModelImpl> get copyWith =>
      __$$AstrologerBankModelImplCopyWithImpl<_$AstrologerBankModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerBankModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerBankModel implements AstrologerBankModel {
  factory _AstrologerBankModel(
      {required final String status,
      required final int code,
      required final String message,
      final BankModel? data,
      final List<BankModel>? history}) = _$AstrologerBankModelImpl;

  factory _AstrologerBankModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerBankModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  BankModel? get data;
  @override
  List<BankModel>? get history;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerBankModelImplCopyWith<_$AstrologerBankModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
