// To parse this JSON data, do
//
//     final movieCredits = movieCreditsFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

MovieCredits movieCreditsFromJson(String str) =>
    MovieCredits.fromJson(json.decode(str));

String movieCreditsToJson(MovieCredits data) => json.encode(data.toJson());

class MovieCredits extends BaseObject<MovieCredits> {
  MovieCredits({
    this.id,
    this.cast,
    //this.crew,
  });

  final int? id;
  final List<Cast>? cast;
  //final List<Cast>? crew;

  MovieCredits copyWith({
    int? id,
    List<Cast>? cast,
    //List<Cast>? crew,
  }) =>
      MovieCredits(
        id: id ?? this.id,
        cast: cast ?? this.cast,
        //crew: crew ?? this.crew,
      );

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        //crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast!.map((x) => x.toJson())),
        //"crew": List<dynamic>.from(crew!.map((x) => x.toJson())),
      };

  @override
  MovieCredits fromJson(json) {
    return MovieCredits.fromJson(json);
  }
}

class Cast extends BaseObject<Cast> {
  Cast({
    this.knownForDepartment,
    this.name,
    this.profilePath,
    this.character,
    this.job,
  });

  final Department? knownForDepartment;
  final String? name;
  final String? profilePath;
  final String? character;
  final String? job;

  Cast copyWith({
    Department? knownForDepartment,
    String? name,
    String? profilePath,
    String? character,
    String? job,
  }) =>
      Cast(
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        profilePath: profilePath ?? this.profilePath,
        character: character ?? this.character,
        job: job ?? this.job,
      );

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        knownForDepartment: departmentValues.map?[json["known_for_department"]],
        name: json["name"],
        profilePath: json["profile_path"],
        character: json["character"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "known_for_department": departmentValues.reverse?[knownForDepartment],
        "name": name,
        "profile_path": profilePath,
        "character": character,
        "job": job,
      };

  @override
  Cast fromJson(json) {
    return Cast.fromJson(json);
  }
}

enum Department { ACTING, DIRECTING, WRITING }

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Directing": Department.DIRECTING,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
