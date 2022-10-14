// To parse this JSON data, do
//
//     final movieGeneric = movieGenericFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

import 'movie.dart';

MovieGeneric movieGenericFromJson(String str) =>
    MovieGeneric.fromJson(json.decode(str));

String movieGenericToJson(MovieGeneric data) => json.encode(data.toJson());

class MovieGeneric extends BaseObject<MovieGeneric> {
  MovieGeneric({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final Dates? dates;
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  MovieGeneric copyWith({
    Dates? dates,
    int? page,
    List<Movie>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieGeneric(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MovieGeneric.fromJson(Map<String, dynamic> json) => MovieGeneric(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": List<Movie>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };

  @override
  MovieGeneric fromJson(json) {
    return MovieGeneric.fromJson(json);
  }
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  final DateTime? maximum;
  final DateTime? minimum;

  Dates copyWith({
    DateTime? maximum,
    DateTime? minimum,
  }) =>
      Dates(
        maximum: maximum ?? this.maximum,
        minimum: minimum ?? this.minimum,
      );

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum?.year.toString().padLeft(4, '0')}-${maximum?.month.toString().padLeft(2, '0')}-${maximum?.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum?.year.toString().padLeft(4, '0')}-${minimum?.month.toString().padLeft(2, '0')}-${minimum?.day.toString().padLeft(2, '0')}",
      };
}

// enum OriginalLanguage { EN, FR, JA }

// final originalLanguageValues = EnumValues({
//   "en": OriginalLanguage.EN,
//   "fr": OriginalLanguage.FR,
//   "ja": OriginalLanguage.JA
// });

// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String>? get reverse {
//     reverseMap ??= map?.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
