import 'dart:convert';

class SingleResponse<T> {
  final String? status;
  final String? msg;
  final int? code;
  final T? data;
  //final List<T>? dataList;

  SingleResponse({
    this.status = '',
    this.msg = '',
    this.code = 0,
    this.data,
    //this.dataList = const [],
  });

  factory SingleResponse.fromJson(
          Map<String, dynamic> json, BaseObject? target) =>
      SingleResponse<T>(
        msg: json.containsKey("msg") ? (json["msg"] ?? "") : "",
        code: json["code"] ?? 0,
        status: json.containsKey("status") ? json["status"] : '',
        data: target?.fromJson(json["data"]),

        // dataList: (json["data"]["results"] is List)
        //     ? List<T>.from(
        //         (json["data"]["results"] as List).map(
        //           (e) => (target)?.fromJson(e),
        //         ),
        //       )
        //     : [],

        // json.containsKey("data")
        //     ? ((json["data"].runtimeType.toString() ==
        //             "_InternalLinkedHashMap<String, dynamic>")
        //         ? List<T>.from(
        //             [
        //               target.fromJson(
        //                 Map<String, dynamic>.from(
        //                   json["data"],
        //                 ),
        //               ),
        //             ],
        //           )
        //         : List<T>.from(
        //             json["data"].map(
        //               (i) => (target).fromJson(i),
        //             ),
        //           ))
        //     : [],
      );
}

abstract class BaseObject<T> {
  T fromJson(json);
}
