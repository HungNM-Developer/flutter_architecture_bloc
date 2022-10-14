import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @Default('') String version,
    @Default('true') String status,
    @Default('') String message,
    @Default(0) int totalRow,
    @Default(0) int rowsPerPage,
    @Default('') String data,
  }) = _ApiResponseData;
  const ApiResponse._();

  void fold({
    Function(ApiResponse)? success,
    Function(String)? error,
  }) {
    if (status == 'true' || status == 'ok') {
      success?.call(this);
    } else {
      error?.call(message);
    }
  }

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiResponseFromJson(json);
}
