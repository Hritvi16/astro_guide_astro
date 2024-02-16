// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PredictionModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PredictionModel _$PredictionModelFromJson(Map<String, dynamic> json) {
  return _PredictionModel.fromJson(json);
}

/// @nodoc
mixin _$PredictionModel {
  String get personal => throw _privateConstructorUsedError;
  String get health => throw _privateConstructorUsedError;
  String get profession => throw _privateConstructorUsedError;
  String get emotions => throw _privateConstructorUsedError;
  String get travel => throw _privateConstructorUsedError;
  List<String> get luck => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionModelCopyWith<PredictionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionModelCopyWith<$Res> {
  factory $PredictionModelCopyWith(
          PredictionModel value, $Res Function(PredictionModel) then) =
      _$PredictionModelCopyWithImpl<$Res, PredictionModel>;
  @useResult
  $Res call(
      {String personal,
      String health,
      String profession,
      String emotions,
      String travel,
      List<String> luck});
}

/// @nodoc
class _$PredictionModelCopyWithImpl<$Res, $Val extends PredictionModel>
    implements $PredictionModelCopyWith<$Res> {
  _$PredictionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personal = null,
    Object? health = null,
    Object? profession = null,
    Object? emotions = null,
    Object? travel = null,
    Object? luck = null,
  }) {
    return _then(_value.copyWith(
      personal: null == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      emotions: null == emotions
          ? _value.emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as String,
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as String,
      luck: null == luck
          ? _value.luck
          : luck // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionModelImplCopyWith<$Res>
    implements $PredictionModelCopyWith<$Res> {
  factory _$$PredictionModelImplCopyWith(_$PredictionModelImpl value,
          $Res Function(_$PredictionModelImpl) then) =
      __$$PredictionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String personal,
      String health,
      String profession,
      String emotions,
      String travel,
      List<String> luck});
}

/// @nodoc
class __$$PredictionModelImplCopyWithImpl<$Res>
    extends _$PredictionModelCopyWithImpl<$Res, _$PredictionModelImpl>
    implements _$$PredictionModelImplCopyWith<$Res> {
  __$$PredictionModelImplCopyWithImpl(
      _$PredictionModelImpl _value, $Res Function(_$PredictionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personal = null,
    Object? health = null,
    Object? profession = null,
    Object? emotions = null,
    Object? travel = null,
    Object? luck = null,
  }) {
    return _then(_$PredictionModelImpl(
      personal: null == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as String,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      profession: null == profession
          ? _value.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String,
      emotions: null == emotions
          ? _value.emotions
          : emotions // ignore: cast_nullable_to_non_nullable
              as String,
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as String,
      luck: null == luck
          ? _value._luck
          : luck // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionModelImpl implements _PredictionModel {
  _$PredictionModelImpl(
      {required this.personal,
      required this.health,
      required this.profession,
      required this.emotions,
      required this.travel,
      required final List<String> luck})
      : _luck = luck;

  factory _$PredictionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionModelImplFromJson(json);

  @override
  final String personal;
  @override
  final String health;
  @override
  final String profession;
  @override
  final String emotions;
  @override
  final String travel;
  final List<String> _luck;
  @override
  List<String> get luck {
    if (_luck is EqualUnmodifiableListView) return _luck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_luck);
  }

  @override
  String toString() {
    return 'PredictionModel(personal: $personal, health: $health, profession: $profession, emotions: $emotions, travel: $travel, luck: $luck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionModelImpl &&
            (identical(other.personal, personal) ||
                other.personal == personal) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.emotions, emotions) ||
                other.emotions == emotions) &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality().equals(other._luck, _luck));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, personal, health, profession,
      emotions, travel, const DeepCollectionEquality().hash(_luck));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      __$$PredictionModelImplCopyWithImpl<_$PredictionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionModelImplToJson(
      this,
    );
  }
}

abstract class _PredictionModel implements PredictionModel {
  factory _PredictionModel(
      {required final String personal,
      required final String health,
      required final String profession,
      required final String emotions,
      required final String travel,
      required final List<String> luck}) = _$PredictionModelImpl;

  factory _PredictionModel.fromJson(Map<String, dynamic> json) =
      _$PredictionModelImpl.fromJson;

  @override
  String get personal;
  @override
  String get health;
  @override
  String get profession;
  @override
  String get emotions;
  @override
  String get travel;
  @override
  List<String> get luck;
  @override
  @JsonKey(ignore: true)
  _$$PredictionModelImplCopyWith<_$PredictionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
