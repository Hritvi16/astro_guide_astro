// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerSpecModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AstrologerSpecModel _$AstrologerSpecModelFromJson(Map<String, dynamic> json) {
  return _AstrologerSpecModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerSpecModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<SpecModel>? get data => throw _privateConstructorUsedError;
  List<SpecModel>? get specs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerSpecModelCopyWith<AstrologerSpecModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerSpecModelCopyWith<$Res> {
  factory $AstrologerSpecModelCopyWith(
          AstrologerSpecModel value, $Res Function(AstrologerSpecModel) then) =
      _$AstrologerSpecModelCopyWithImpl<$Res, AstrologerSpecModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<SpecModel>? data,
      List<SpecModel>? specs});
}

/// @nodoc
class _$AstrologerSpecModelCopyWithImpl<$Res, $Val extends AstrologerSpecModel>
    implements $AstrologerSpecModelCopyWith<$Res> {
  _$AstrologerSpecModelCopyWithImpl(this._value, this._then);

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
    Object? specs = freezed,
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
              as List<SpecModel>?,
      specs: freezed == specs
          ? _value.specs
          : specs // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AstrologerSpecModelImplCopyWith<$Res>
    implements $AstrologerSpecModelCopyWith<$Res> {
  factory _$$AstrologerSpecModelImplCopyWith(_$AstrologerSpecModelImpl value,
          $Res Function(_$AstrologerSpecModelImpl) then) =
      __$$AstrologerSpecModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<SpecModel>? data,
      List<SpecModel>? specs});
}

/// @nodoc
class __$$AstrologerSpecModelImplCopyWithImpl<$Res>
    extends _$AstrologerSpecModelCopyWithImpl<$Res, _$AstrologerSpecModelImpl>
    implements _$$AstrologerSpecModelImplCopyWith<$Res> {
  __$$AstrologerSpecModelImplCopyWithImpl(_$AstrologerSpecModelImpl _value,
      $Res Function(_$AstrologerSpecModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? specs = freezed,
  }) {
    return _then(_$AstrologerSpecModelImpl(
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
              as List<SpecModel>?,
      specs: freezed == specs
          ? _value._specs
          : specs // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerSpecModelImpl implements _AstrologerSpecModel {
  _$AstrologerSpecModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<SpecModel>? data,
      final List<SpecModel>? specs})
      : _data = data,
        _specs = specs;

  factory _$AstrologerSpecModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerSpecModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<SpecModel>? _data;
  @override
  List<SpecModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpecModel>? _specs;
  @override
  List<SpecModel>? get specs {
    final value = _specs;
    if (value == null) return null;
    if (_specs is EqualUnmodifiableListView) return _specs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerSpecModel(status: $status, code: $code, message: $message, data: $data, specs: $specs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerSpecModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._specs, _specs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_specs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstrologerSpecModelImplCopyWith<_$AstrologerSpecModelImpl> get copyWith =>
      __$$AstrologerSpecModelImplCopyWithImpl<_$AstrologerSpecModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerSpecModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerSpecModel implements AstrologerSpecModel {
  factory _AstrologerSpecModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<SpecModel>? data,
      final List<SpecModel>? specs}) = _$AstrologerSpecModelImpl;

  factory _AstrologerSpecModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerSpecModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<SpecModel>? get data;
  @override
  List<SpecModel>? get specs;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerSpecModelImplCopyWith<_$AstrologerSpecModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
