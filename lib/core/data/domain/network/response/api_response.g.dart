// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponseData<T> _$$_ApiResponseDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ApiResponseData<T>(
      version: json['version'] as String? ?? '',
      status: json['status'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      totalRow: json['totalRow'] as int? ?? 0,
      rowsPerPage: json['rowsPerPage'] as int? ?? 0,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$_ApiResponseDataToJson<T>(
  _$_ApiResponseData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'version': instance.version,
      'status': instance.status,
      'message': instance.message,
      'totalRow': instance.totalRow,
      'rowsPerPage': instance.rowsPerPage,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
