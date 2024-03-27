// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AshtakootMilanResultModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AshtakootMilanResultModel _$AshtakootMilanResultModelFromJson(
    Map<String, dynamic> json) {
  return _AshtakootMilanResultModel.fromJson(json);
}

/// @nodoc
mixin _$AshtakootMilanResultModel {
  double get points_obtained => throw _privateConstructorUsedError;
  double get max_ponits => throw _privateConstructorUsedError;
  String get is_compatible => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AshtakootMilanResultModelCopyWith<AshtakootMilanResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AshtakootMilanResultModelCopyWith<$Res> {
  factory $AshtakootMilanResultModelCopyWith(AshtakootMilanResultModel value,
          $Res Function(AshtakootMilanResultModel) then) =
      _$AshtakootMilanResultModelCopyWithImpl<$Res, AshtakootMilanResultModel>;
  @useResult
  $Res call(
      {double points_obtained,
      double max_ponits,
      String is_compatible,
      String content});
}

/// @nodoc
class _$AshtakootMilanResultModelCopyWithImpl<$Res,
        $Val extends AshtakootMilanResultModel>
    implements $AshtakootMilanResultModelCopyWith<$Res> {
  _$AshtakootMilanResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points_obtained = null,
    Object? max_ponits = null,
    Object? is_compatible = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      points_obtained: null == points_obtained
          ? _value.points_obtained
          : points_obtained // ignore: cast_nullable_to_non_nullable
              as double,
      max_ponits: null == max_ponits
          ? _value.max_ponits
          : max_ponits // ignore: cast_nullable_to_non_nullable
              as double,
      is_compatible: null == is_compatible
          ? _value.is_compatible
          : is_compatible // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AshtakootMilanResultModelImplCopyWith<$Res>
    implements $AshtakootMilanResultModelCopyWith<$Res> {
  factory _$$AshtakootMilanResultModelImplCopyWith(
          _$AshtakootMilanResultModelImpl value,
          $Res Function(_$AshtakootMilanResultModelImpl) then) =
      __$$AshtakootMilanResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double points_obtained,
      double max_ponits,
      String is_compatible,
      String content});
}

/// @nodoc
class __$$AshtakootMilanResultModelImplCopyWithImpl<$Res>
    extends _$AshtakootMilanResultModelCopyWithImpl<$Res,
        _$AshtakootMilanResultModelImpl>
    implements _$$AshtakootMilanResultModelImplCopyWith<$Res> {
  __$$AshtakootMilanResultModelImplCopyWithImpl(
      _$AshtakootMilanResultModelImpl _value,
      $Res Function(_$AshtakootMilanResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points_obtained = null,
    Object? max_ponits = null,
    Object? is_compatible = null,
    Object? content = null,
  }) {
    return _then(_$AshtakootMilanResultModelImpl(
      points_obtained: null == points_obtained
          ? _value.points_obtained
          : points_obtained // ignore: cast_nullable_to_non_nullable
              as double,
      max_ponits: null == max_ponits
          ? _value.max_ponits
          : max_ponits // ignore: cast_nullable_to_non_nullable
              as double,
      is_compatible: null == is_compatible
          ? _value.is_compatible
          : is_compatible // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AshtakootMilanResultModelImpl implements _AshtakootMilanResultModel {
  _$AshtakootMilanResultModelImpl(
      {required this.points_obtained,
      required this.max_ponits,
      required this.is_compatible,
      required this.content});

  factory _$AshtakootMilanResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AshtakootMilanResultModelImplFromJson(json);

  @override
  final double points_obtained;
  @override
  final double max_ponits;
  @override
  final String is_compatible;
  @override
  final String content;

  @override
  String toString() {
    return 'AshtakootMilanResultModel(points_obtained: $points_obtained, max_ponits: $max_ponits, is_compatible: $is_compatible, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AshtakootMilanResultModelImpl &&
            (identical(other.points_obtained, points_obtained) ||
                other.points_obtained == points_obtained) &&
            (identical(other.max_ponits, max_ponits) ||
                other.max_ponits == max_ponits) &&
            (identical(other.is_compatible, is_compatible) ||
                other.is_compatible == is_compatible) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, points_obtained, max_ponits, is_compatible, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AshtakootMilanResultModelImplCopyWith<_$AshtakootMilanResultModelImpl>
      get copyWith => __$$AshtakootMilanResultModelImplCopyWithImpl<
          _$AshtakootMilanResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AshtakootMilanResultModelImplToJson(
      this,
    );
  }
}

abstract class _AshtakootMilanResultModel implements AshtakootMilanResultModel {
  factory _AshtakootMilanResultModel(
      {required final double points_obtained,
      required final double max_ponits,
      required final String is_compatible,
      required final String content}) = _$AshtakootMilanResultModelImpl;

  factory _AshtakootMilanResultModel.fromJson(Map<String, dynamic> json) =
      _$AshtakootMilanResultModelImpl.fromJson;

  @override
  double get points_obtained;
  @override
  double get max_ponits;
  @override
  String get is_compatible;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$AshtakootMilanResultModelImplCopyWith<_$AshtakootMilanResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
