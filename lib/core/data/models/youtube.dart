// To parse this JSON data, do
//
//     final youtube = youtubeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

Youtube youtubeFromJson(String str) => Youtube.fromJson(json.decode(str));

String youtubeToJson(Youtube data) => json.encode(data.toJson());

class Youtube extends BaseObject<Youtube> {
  Youtube({
    this.id,
    this.results,
  });

  final int? id;
  final List<Video>? results;

  Youtube copyWith({
    int? id,
    List<Video>? results,
  }) =>
      Youtube(
        id: id ?? this.id,
        results: results ?? this.results,
      );

  factory Youtube.fromJson(Map<String, dynamic> json) => Youtube(
        id: json["id"],
        results: List<Video>.from(
          json["results"].map(
            (x) => Video.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(
          results!.map(
            (x) => x.toJson(),
          ),
        ),
      };

  @override
  Youtube fromJson(json) {
    return Youtube.fromJson(json);
  }
}

class Video extends BaseObject<Video> {
  Video({
    this.name,
    this.key,
  });

  final String? name;
  final String? key;

  Video copyWith({
    String? name,
    String? key,
  }) =>
      Video(
        name: name ?? this.name,
        key: key ?? this.key,
      );

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        name: json["name"],
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "key": key,
      };

  @override
  Video fromJson(json) {
    return Video.fromJson(json);
  }
}
