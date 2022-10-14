// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponseData _$$_ApiResponseDataFromJson(Map<String, dynamic> json) =>
    _$_ApiResponseData(
      version: json['version'] as String? ?? '',
      status: json['status'] as String? ?? 'true',
      message: json['message'] as String? ?? '',
      totalRow: json['totalRow'] as int? ?? 0,
      rowsPerPage: json['rowsPerPage'] as int? ?? 0,
      data: json['data'] as String? ?? '',
    );

Map<String, dynamic> _$$_ApiResponseDataToJson(_$_ApiResponseData instance) =>
    <String, dynamic>{
      'version': instance.version,
      'status': instance.status,
      'message': instance.message,
      'totalRow': instance.totalRow,
      'rowsPerPage': instance.rowsPerPage,
      'data': instance.data,
    };
