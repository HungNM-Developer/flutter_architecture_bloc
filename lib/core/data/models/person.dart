// To parse this JSON data, do
//
//     final personGeneric = personGenericFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

PersonGeneric personGenericFromJson(String str) =>
    PersonGeneric.fromJson(json.decode(str));

String personGenericToJson(PersonGeneric data) => json.encode(data.toJson());

class PersonGeneric {
  PersonGeneric({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<Person>? results;
  final int? totalPages;
  final int? totalResults;

  PersonGeneric copyWith({
    int? page,
    List<Person>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      PersonGeneric(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory PersonGeneric.fromJson(Map<String, dynamic> json) => PersonGeneric(
        page: json["page"],
        results: List<Person>.from(
          json["results"].map(
            (x) => Person.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Person {
  Person({
    this.adult,
    this.id,
    this.name,
    this.originalName,
    this.mediaType,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
  });

  final bool? adult;
  final int? id;
  final String? name;
  final String? originalName;
  final ResultMediaType? mediaType;
  final double? popularity;
  final int? gender;
  final KnownForDepartment? knownForDepartment;
  final String? profilePath;
  final List<KnownFor>? knownFor;

  Person copyWith({
    bool? adult,
    int? id,
    String? name,
    String? originalName,
    ResultMediaType? mediaType,
    double? popularity,
    int? gender,
    KnownForDepartment? knownForDepartment,
    String? profilePath,
    List<KnownFor>? knownFor,
  }) =>
      Person(
        adult: adult ?? this.adult,
        id: id ?? this.id,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        mediaType: mediaType ?? this.mediaType,
        popularity: popularity ?? this.popularity,
        gender: gender ?? this.gender,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        profilePath: profilePath ?? this.profilePath,
        knownFor: knownFor ?? this.knownFor,
      );

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        adult: json["adult"],
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        mediaType: resultMediaTypeValues.map?[json["media_type"]],
        popularity: json["popularity"].toDouble(),
        gender: json["gender"],
        knownForDepartment:
            knownForDepartmentValues.map?[json["known_for_department"]],
        profilePath: json["profile_path"] ?? '',
        knownFor: List<KnownFor>.from(
            json["known_for"].map((x) => KnownFor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "id": id,
        "name": name,
        "original_name": originalName,
        "media_type": resultMediaTypeValues.reverse?[mediaType],
        "popularity": popularity,
        "gender": gender,
        "known_for_department":
            knownForDepartmentValues.reverse?[knownForDepartment],
        "profile_path": profilePath ?? '',
        "known_for": List<dynamic>.from(knownFor!.map((x) => x.toJson())),
      };
}

class KnownFor {
  KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final KnownForMediaType? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  KnownFor copyWith({
    bool? adult,
    String? backdropPath,
    int? id,
    String? title,
    OriginalLanguage? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    KnownForMediaType? mediaType,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      KnownFor(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        title: title ?? this.title,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        mediaType: mediaType ?? this.mediaType,
        genreIds: genreIds ?? this.genreIds,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage:
            originalLanguageValues.map?[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: knownForMediaTypeValues.map?[json["media_type"]],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"].toDouble(),
        releaseDate: DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguageValues.reverse?[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": knownForMediaTypeValues.reverse?[mediaType],
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum KnownForMediaType { MOVIE }

final knownForMediaTypeValues = EnumValues({"movie": KnownForMediaType.MOVIE});

enum OriginalLanguage { TE, EN }

final originalLanguageValues =
    EnumValues({"en": OriginalLanguage.EN, "te": OriginalLanguage.TE});

enum KnownForDepartment { ACTING, DIRECTING, CREATOR }

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Creator": KnownForDepartment.CREATOR,
  "Directing": KnownForDepartment.DIRECTING
});

enum ResultMediaType { PERSON }

final resultMediaTypeValues = EnumValues({"person": ResultMediaType.PERSON});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
