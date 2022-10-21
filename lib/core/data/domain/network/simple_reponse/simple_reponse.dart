class SingleResponse<T> {
  final String? status;
  final String? msg;
  final int? code;
  final T? data;

  SingleResponse({
    this.status = '',
    this.msg = '',
    this.code = 0,
    this.data,
  });

  void fold({
    Function(SingleResponse<T>)? success,
    Function(String)? error,
  }) {
    if (status == 'ok') {
      success?.call(this);
    } else {
      error?.call(msg ?? '');
    }
  }

  factory SingleResponse.fromJson(
          Map<String, dynamic> json, BaseObject? target) =>
      SingleResponse<T>(
        msg: json.containsKey("msg") ? (json["msg"] ?? "") : "",
        code: json["code"] ?? 0,
        status: json.containsKey("status") ? json["status"] : '',
        data: target?.fromJson(json["data"]),
      );
}

abstract class BaseObject<T> {
  T fromJson(json);
}
