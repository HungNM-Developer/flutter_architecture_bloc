// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponseData<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  String get version => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get totalRow => throw _privateConstructorUsedError;
  int get rowsPerPage => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res>;
  $Res call(
      {String version,
      bool status,
      String message,
      int totalRow,
      int rowsPerPage,
      T? data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ApiResponse<T>) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? totalRow = freezed,
    Object? rowsPerPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRow: totalRow == freezed
          ? _value.totalRow
          : totalRow // ignore: cast_nullable_to_non_nullable
              as int,
      rowsPerPage: rowsPerPage == freezed
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiResponseDataCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$_ApiResponseDataCopyWith(_$_ApiResponseData<T> value,
          $Res Function(_$_ApiResponseData<T>) then) =
      __$$_ApiResponseDataCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {String version,
      bool status,
      String message,
      int totalRow,
      int rowsPerPage,
      T? data});
}

/// @nodoc
class __$$_ApiResponseDataCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res>
    implements _$$_ApiResponseDataCopyWith<T, $Res> {
  __$$_ApiResponseDataCopyWithImpl(
      _$_ApiResponseData<T> _value, $Res Function(_$_ApiResponseData<T>) _then)
      : super(_value, (v) => _then(v as _$_ApiResponseData<T>));

  @override
  _$_ApiResponseData<T> get _value => super._value as _$_ApiResponseData<T>;

  @override
  $Res call({
    Object? version = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? totalRow = freezed,
    Object? rowsPerPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ApiResponseData<T>(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRow: totalRow == freezed
          ? _value.totalRow
          : totalRow // ignore: cast_nullable_to_non_nullable
              as int,
      rowsPerPage: rowsPerPage == freezed
          ? _value.rowsPerPage
          : rowsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ApiResponseData<T> extends _ApiResponseData<T> {
  const _$_ApiResponseData(
      {this.version = '',
      this.status = true,
      this.message = '',
      this.totalRow = 0,
      this.rowsPerPage = 0,
      this.data})
      : super._();

  factory _$_ApiResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ApiResponseDataFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final bool status;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int totalRow;
  @override
  @JsonKey()
  final int rowsPerPage;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiResponse<$T>(version: $version, status: $status, message: $message, totalRow: $totalRow, rowsPerPage: $rowsPerPage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResponseData<T> &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.totalRow, totalRow) &&
            const DeepCollectionEquality()
                .equals(other.rowsPerPage, rowsPerPage) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(totalRow),
      const DeepCollectionEquality().hash(rowsPerPage),
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_ApiResponseDataCopyWith<T, _$_ApiResponseData<T>> get copyWith =>
      __$$_ApiResponseDataCopyWithImpl<T, _$_ApiResponseData<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ApiResponseDataToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponseData<T> extends ApiResponse<T> {
  const factory _ApiResponseData(
      {final String version,
      final bool status,
      final String message,
      final int totalRow,
      final int rowsPerPage,
      final T? data}) = _$_ApiResponseData<T>;
  const _ApiResponseData._() : super._();

  factory _ApiResponseData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ApiResponseData<T>.fromJson;

  @override
  String get version;
  @override
  bool get status;
  @override
  String get message;
  @override
  int get totalRow;
  @override
  int get rowsPerPage;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiResponseDataCopyWith<T, _$_ApiResponseData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
