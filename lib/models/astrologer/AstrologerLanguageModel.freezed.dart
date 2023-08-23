// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerLanguageModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AstrologerLanguageModel _$AstrologerLanguageModelFromJson(
    Map<String, dynamic> json) {
  return _AstrologerLanguageModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerLanguageModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<LanguageModel>? get data => throw _privateConstructorUsedError;
  List<LanguageModel>? get languages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerLanguageModelCopyWith<AstrologerLanguageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerLanguageModelCopyWith<$Res> {
  factory $AstrologerLanguageModelCopyWith(AstrologerLanguageModel value,
          $Res Function(AstrologerLanguageModel) then) =
      _$AstrologerLanguageModelCopyWithImpl<$Res, AstrologerLanguageModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<LanguageModel>? data,
      List<LanguageModel>? languages});
}

/// @nodoc
class _$AstrologerLanguageModelCopyWithImpl<$Res,
        $Val extends AstrologerLanguageModel>
    implements $AstrologerLanguageModelCopyWith<$Res> {
  _$AstrologerLanguageModelCopyWithImpl(this._value, this._then);

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
    Object? languages = freezed,
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
              as List<LanguageModel>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AstrologerLanguageModelCopyWith<$Res>
    implements $AstrologerLanguageModelCopyWith<$Res> {
  factory _$$_AstrologerLanguageModelCopyWith(_$_AstrologerLanguageModel value,
          $Res Function(_$_AstrologerLanguageModel) then) =
      __$$_AstrologerLanguageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<LanguageModel>? data,
      List<LanguageModel>? languages});
}

/// @nodoc
class __$$_AstrologerLanguageModelCopyWithImpl<$Res>
    extends _$AstrologerLanguageModelCopyWithImpl<$Res,
        _$_AstrologerLanguageModel>
    implements _$$_AstrologerLanguageModelCopyWith<$Res> {
  __$$_AstrologerLanguageModelCopyWithImpl(_$_AstrologerLanguageModel _value,
      $Res Function(_$_AstrologerLanguageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? languages = freezed,
  }) {
    return _then(_$_AstrologerLanguageModel(
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
              as List<LanguageModel>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AstrologerLanguageModel implements _AstrologerLanguageModel {
  _$_AstrologerLanguageModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<LanguageModel>? data,
      final List<LanguageModel>? languages})
      : _data = data,
        _languages = languages;

  factory _$_AstrologerLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$$_AstrologerLanguageModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<LanguageModel>? _data;
  @override
  List<LanguageModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LanguageModel>? _languages;
  @override
  List<LanguageModel>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerLanguageModel(status: $status, code: $code, message: $message, data: $data, languages: $languages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AstrologerLanguageModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_languages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AstrologerLanguageModelCopyWith<_$_AstrologerLanguageModel>
      get copyWith =>
          __$$_AstrologerLanguageModelCopyWithImpl<_$_AstrologerLanguageModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AstrologerLanguageModelToJson(
      this,
    );
  }
}

abstract class _AstrologerLanguageModel implements AstrologerLanguageModel {
  factory _AstrologerLanguageModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<LanguageModel>? data,
      final List<LanguageModel>? languages}) = _$_AstrologerLanguageModel;

  factory _AstrologerLanguageModel.fromJson(Map<String, dynamic> json) =
      _$_AstrologerLanguageModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<LanguageModel>? get data;
  @override
  List<LanguageModel>? get languages;
  @override
  @JsonKey(ignore: true)
  _$$_AstrologerLanguageModelCopyWith<_$_AstrologerLanguageModel>
      get copyWith => throw _privateConstructorUsedError;
}
