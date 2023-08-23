// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerGalleryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AstrologerGalleryModel _$AstrologerGalleryModelFromJson(
    Map<String, dynamic> json) {
  return _AstrologerGalleryModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerGalleryModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<GalleryModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerGalleryModelCopyWith<AstrologerGalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerGalleryModelCopyWith<$Res> {
  factory $AstrologerGalleryModelCopyWith(AstrologerGalleryModel value,
          $Res Function(AstrologerGalleryModel) then) =
      _$AstrologerGalleryModelCopyWithImpl<$Res, AstrologerGalleryModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<GalleryModel>? data});
}

/// @nodoc
class _$AstrologerGalleryModelCopyWithImpl<$Res,
        $Val extends AstrologerGalleryModel>
    implements $AstrologerGalleryModelCopyWith<$Res> {
  _$AstrologerGalleryModelCopyWithImpl(this._value, this._then);

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
              as List<GalleryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AstrologerGalleryModelCopyWith<$Res>
    implements $AstrologerGalleryModelCopyWith<$Res> {
  factory _$$_AstrologerGalleryModelCopyWith(_$_AstrologerGalleryModel value,
          $Res Function(_$_AstrologerGalleryModel) then) =
      __$$_AstrologerGalleryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<GalleryModel>? data});
}

/// @nodoc
class __$$_AstrologerGalleryModelCopyWithImpl<$Res>
    extends _$AstrologerGalleryModelCopyWithImpl<$Res,
        _$_AstrologerGalleryModel>
    implements _$$_AstrologerGalleryModelCopyWith<$Res> {
  __$$_AstrologerGalleryModelCopyWithImpl(_$_AstrologerGalleryModel _value,
      $Res Function(_$_AstrologerGalleryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_AstrologerGalleryModel(
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
              as List<GalleryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AstrologerGalleryModel implements _AstrologerGalleryModel {
  _$_AstrologerGalleryModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<GalleryModel>? data})
      : _data = data;

  factory _$_AstrologerGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$$_AstrologerGalleryModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<GalleryModel>? _data;
  @override
  List<GalleryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerGalleryModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AstrologerGalleryModel &&
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
  _$$_AstrologerGalleryModelCopyWith<_$_AstrologerGalleryModel> get copyWith =>
      __$$_AstrologerGalleryModelCopyWithImpl<_$_AstrologerGalleryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AstrologerGalleryModelToJson(
      this,
    );
  }
}

abstract class _AstrologerGalleryModel implements AstrologerGalleryModel {
  factory _AstrologerGalleryModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<GalleryModel>? data}) = _$_AstrologerGalleryModel;

  factory _AstrologerGalleryModel.fromJson(Map<String, dynamic> json) =
      _$_AstrologerGalleryModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<GalleryModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_AstrologerGalleryModelCopyWith<_$_AstrologerGalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
