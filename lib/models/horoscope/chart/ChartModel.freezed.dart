// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChartModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChartModel _$ChartModelFromJson(Map<String, dynamic> json) {
  return _ChartModel.fromJson(json);
}

/// @nodoc
mixin _$ChartModel {
  String get svg => throw _privateConstructorUsedError;
  String get base64_image => throw _privateConstructorUsedError;
  Map<String, ChartDataModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartModelCopyWith<ChartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartModelCopyWith<$Res> {
  factory $ChartModelCopyWith(
          ChartModel value, $Res Function(ChartModel) then) =
      _$ChartModelCopyWithImpl<$Res, ChartModel>;
  @useResult
  $Res call(
      {String svg, String base64_image, Map<String, ChartDataModel> data});
}

/// @nodoc
class _$ChartModelCopyWithImpl<$Res, $Val extends ChartModel>
    implements $ChartModelCopyWith<$Res> {
  _$ChartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svg = null,
    Object? base64_image = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      svg: null == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String,
      base64_image: null == base64_image
          ? _value.base64_image
          : base64_image // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, ChartDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartModelImplCopyWith<$Res>
    implements $ChartModelCopyWith<$Res> {
  factory _$$ChartModelImplCopyWith(
          _$ChartModelImpl value, $Res Function(_$ChartModelImpl) then) =
      __$$ChartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String svg, String base64_image, Map<String, ChartDataModel> data});
}

/// @nodoc
class __$$ChartModelImplCopyWithImpl<$Res>
    extends _$ChartModelCopyWithImpl<$Res, _$ChartModelImpl>
    implements _$$ChartModelImplCopyWith<$Res> {
  __$$ChartModelImplCopyWithImpl(
      _$ChartModelImpl _value, $Res Function(_$ChartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svg = null,
    Object? base64_image = null,
    Object? data = null,
  }) {
    return _then(_$ChartModelImpl(
      svg: null == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String,
      base64_image: null == base64_image
          ? _value.base64_image
          : base64_image // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, ChartDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChartModelImpl implements _ChartModel {
  _$ChartModelImpl(
      {required this.svg,
      required this.base64_image,
      required final Map<String, ChartDataModel> data})
      : _data = data;

  factory _$ChartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChartModelImplFromJson(json);

  @override
  final String svg;
  @override
  final String base64_image;
  final Map<String, ChartDataModel> _data;
  @override
  Map<String, ChartDataModel> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'ChartModel(svg: $svg, base64_image: $base64_image, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartModelImpl &&
            (identical(other.svg, svg) || other.svg == svg) &&
            (identical(other.base64_image, base64_image) ||
                other.base64_image == base64_image) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, svg, base64_image,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartModelImplCopyWith<_$ChartModelImpl> get copyWith =>
      __$$ChartModelImplCopyWithImpl<_$ChartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChartModelImplToJson(
      this,
    );
  }
}

abstract class _ChartModel implements ChartModel {
  factory _ChartModel(
      {required final String svg,
      required final String base64_image,
      required final Map<String, ChartDataModel> data}) = _$ChartModelImpl;

  factory _ChartModel.fromJson(Map<String, dynamic> json) =
      _$ChartModelImpl.fromJson;

  @override
  String get svg;
  @override
  String get base64_image;
  @override
  Map<String, ChartDataModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$ChartModelImplCopyWith<_$ChartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
