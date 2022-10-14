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

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponseData.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  String get version => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get totalRow => throw _privateConstructorUsedError;
  int get rowsPerPage => throw _privateConstructorUsedError;
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res>;
  $Res call(
      {String version,
      String status,
      String message,
      int totalRow,
      int rowsPerPage,
      String data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res> implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse _value;
  // ignore: unused_field
  final $Res Function(ApiResponse) _then;

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
              as String,
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
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiResponseDataCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$_ApiResponseDataCopyWith(
          _$_ApiResponseData value, $Res Function(_$_ApiResponseData) then) =
      __$$_ApiResponseDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String version,
      String status,
      String message,
      int totalRow,
      int rowsPerPage,
      String data});
}

/// @nodoc
class __$$_ApiResponseDataCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res>
    implements _$$_ApiResponseDataCopyWith<$Res> {
  __$$_ApiResponseDataCopyWithImpl(
      _$_ApiResponseData _value, $Res Function(_$_ApiResponseData) _then)
      : super(_value, (v) => _then(v as _$_ApiResponseData));

  @override
  _$_ApiResponseData get _value => super._value as _$_ApiResponseData;

  @override
  $Res call({
    Object? version = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? totalRow = freezed,
    Object? rowsPerPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ApiResponseData(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResponseData extends _ApiResponseData {
  const _$_ApiResponseData(
      {this.version = '',
      this.status = 'true',
      this.message = '',
      this.totalRow = 0,
      this.rowsPerPage = 0,
      this.data = ''})
      : super._();

  factory _$_ApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$$_ApiResponseDataFromJson(json);

  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final String status;
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
  @JsonKey()
  final String data;

  @override
  String toString() {
    return 'ApiResponse(version: $version, status: $status, message: $message, totalRow: $totalRow, rowsPerPage: $rowsPerPage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResponseData &&
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
  _$$_ApiResponseDataCopyWith<_$_ApiResponseData> get copyWith =>
      __$$_ApiResponseDataCopyWithImpl<_$_ApiResponseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiResponseDataToJson(
      this,
    );
  }
}

abstract class _ApiResponseData extends ApiResponse {
  const factory _ApiResponseData(
      {final String version,
      final String status,
      final String message,
      final int totalRow,
      final int rowsPerPage,
      final String data}) = _$_ApiResponseData;
  const _ApiResponseData._() : super._();

  factory _ApiResponseData.fromJson(Map<String, dynamic> json) =
      _$_ApiResponseData.fromJson;

  @override
  String get version;
  @override
  String get status;
  @override
  String get message;
  @override
  int get totalRow;
  @override
  int get rowsPerPage;
  @override
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiResponseDataCopyWith<_$_ApiResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}
