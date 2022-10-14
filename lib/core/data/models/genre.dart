// To parse this JSON data, do
//
//     final genresGeneric = genresGenericFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

GenresGeneric genresGenericFromJson(String str) =>
    GenresGeneric.fromJson(json.decode(str));

String genresGenericToJson(GenresGeneric data) => json.encode(data.toJson());

class GenresGeneric extends BaseObject<GenresGeneric> {
  GenresGeneric({
    this.genres,
  });

  final List<Genre>? genres;

  GenresGeneric copyWith({
    List<Genre>? genres,
  }) =>
      GenresGeneric(
        genres: genres ?? this.genres,
      );

  factory GenresGeneric.fromJson(Map<String, dynamic> json) => GenresGeneric(
        genres: List<Genre>.from(
          json["genres"].map(
            (x) => Genre.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(
          genres!.map(
            (x) => x.toJson(),
          ),
        ),
      };

  @override
  GenresGeneric fromJson(json) {
    return GenresGeneric.fromJson(json);
  }
}

class Genre extends BaseObject<Genre> {
  Genre({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  Genre fromJson(json) {
    return Genre.fromJson(json);
  }
}
