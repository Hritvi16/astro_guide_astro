// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AstrologerResponseModel _$AstrologerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AstrologerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AstrologerModel? get data => throw _privateConstructorUsedError;
  List<CountryModel>? get countries => throw _privateConstructorUsedError;
  List<CityModel>? get cities => throw _privateConstructorUsedError;
  List<LanguageModel>? get languages => throw _privateConstructorUsedError;
  List<SpecModel>? get specifications => throw _privateConstructorUsedError;
  List<TypeModel>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerResponseModelCopyWith<AstrologerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerResponseModelCopyWith<$Res> {
  factory $AstrologerResponseModelCopyWith(AstrologerResponseModel value,
          $Res Function(AstrologerResponseModel) then) =
      _$AstrologerResponseModelCopyWithImpl<$Res, AstrologerResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? data,
      List<CountryModel>? countries,
      List<CityModel>? cities,
      List<LanguageModel>? languages,
      List<SpecModel>? specifications,
      List<TypeModel>? types});

  $AstrologerModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$AstrologerResponseModelCopyWithImpl<$Res,
        $Val extends AstrologerResponseModel>
    implements $AstrologerResponseModelCopyWith<$Res> {
  _$AstrologerResponseModelCopyWithImpl(this._value, this._then);

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
    Object? countries = freezed,
    Object? cities = freezed,
    Object? languages = freezed,
    Object? specifications = freezed,
    Object? types = freezed,
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
              as AstrologerModel?,
      countries: freezed == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AstrologerModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AstrologerModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AstrologerResponseModelImplCopyWith<$Res>
    implements $AstrologerResponseModelCopyWith<$Res> {
  factory _$$AstrologerResponseModelImplCopyWith(
          _$AstrologerResponseModelImpl value,
          $Res Function(_$AstrologerResponseModelImpl) then) =
      __$$AstrologerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? data,
      List<CountryModel>? countries,
      List<CityModel>? cities,
      List<LanguageModel>? languages,
      List<SpecModel>? specifications,
      List<TypeModel>? types});

  @override
  $AstrologerModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AstrologerResponseModelImplCopyWithImpl<$Res>
    extends _$AstrologerResponseModelCopyWithImpl<$Res,
        _$AstrologerResponseModelImpl>
    implements _$$AstrologerResponseModelImplCopyWith<$Res> {
  __$$AstrologerResponseModelImplCopyWithImpl(
      _$AstrologerResponseModelImpl _value,
      $Res Function(_$AstrologerResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? countries = freezed,
    Object? cities = freezed,
    Object? languages = freezed,
    Object? specifications = freezed,
    Object? types = freezed,
  }) {
    return _then(_$AstrologerResponseModelImpl(
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
              as AstrologerModel?,
      countries: freezed == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerResponseModelImpl implements _AstrologerResponseModel {
  _$AstrologerResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      final List<CountryModel>? countries,
      final List<CityModel>? cities,
      final List<LanguageModel>? languages,
      final List<SpecModel>? specifications,
      final List<TypeModel>? types})
      : _countries = countries,
        _cities = cities,
        _languages = languages,
        _specifications = specifications,
        _types = types;

  factory _$AstrologerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final AstrologerModel? data;
  final List<CountryModel>? _countries;
  @override
  List<CountryModel>? get countries {
    final value = _countries;
    if (value == null) return null;
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CityModel>? _cities;
  @override
  List<CityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
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

  final List<SpecModel>? _specifications;
  @override
  List<SpecModel>? get specifications {
    final value = _specifications;
    if (value == null) return null;
    if (_specifications is EqualUnmodifiableListView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TypeModel>? _types;
  @override
  List<TypeModel>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerResponseModel(status: $status, code: $code, message: $message, data: $data, countries: $countries, cities: $cities, languages: $languages, specifications: $specifications, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      data,
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_specifications),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstrologerResponseModelImplCopyWith<_$AstrologerResponseModelImpl>
      get copyWith => __$$AstrologerResponseModelImplCopyWithImpl<
          _$AstrologerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerResponseModel implements AstrologerResponseModel {
  factory _AstrologerResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final AstrologerModel? data,
      final List<CountryModel>? countries,
      final List<CityModel>? cities,
      final List<LanguageModel>? languages,
      final List<SpecModel>? specifications,
      final List<TypeModel>? types}) = _$AstrologerResponseModelImpl;

  factory _AstrologerResponseModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  AstrologerModel? get data;
  @override
  List<CountryModel>? get countries;
  @override
  List<CityModel>? get cities;
  @override
  List<LanguageModel>? get languages;
  @override
  List<SpecModel>? get specifications;
  @override
  List<TypeModel>? get types;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerResponseModelImplCopyWith<_$AstrologerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
