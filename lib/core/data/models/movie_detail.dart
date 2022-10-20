import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';
import 'package:flutter_architecture_bloc/core/data/models/genre.dart';
import 'movie_credits.dart';
import 'movie_image.dart';

class MovieDetail extends BaseObject<MovieDetail> {
  final String? id;
  final String? title;
  final String? backdropPath;
  final String? budget;
  final String? homePage;
  final String? originalTitle;
  final String? overview;
  final String? releaseDate;
  final int? runtime;
  final String? voteAverage;
  final String? voteCount;
  final List<Genre>? genres;

  String? trailerId;

  MovieImage? movieImage;

  List<Cast>? castList;

  MovieDetail({
    this.id,
    this.title,
    this.backdropPath,
    this.budget,
    this.homePage,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.runtime = 0,
    this.voteAverage,
    this.voteCount,
    this.genres,
  });

  factory MovieDetail.fromJson(dynamic json) {
    if (json == null) {
      return MovieDetail();
    }

    return MovieDetail(
      id: json['id'].toString(),
      title: json['title'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'].toString(),
      homePage: json['home_page'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'].toString(),
      voteCount: json['vote_count'].toString(),
      genres: List<Genre>.from(
        json["genres"].map(
          (x) => Genre.fromJson(x),
        ),
      ),
    );
  }

  double rating() =>
      double.parse((5 * double.parse(voteAverage!) / 10).toStringAsFixed(1));

  String genresName() {
    List<String> listNameCategory = [];
    for (final item in genres ?? []) {
      listNameCategory.add(item.name ?? '');
    }
    String category = '';
    if (listNameCategory.length > 2) {
      final lastString = '& ${listNameCategory.removeLast()}';
      category = '${listNameCategory.join(', ')} $lastString';
    } else {
      category = listNameCategory.join(' & ');
    }

    return category;
  }

  String intToTimeLeft(int value) {
    final h = value ~/ 60;

    final m = value - (h * 60);

    String hourLeft = h.toString();

    String minuteLeft = m.toString();

    String result = "$hourLeft h $minuteLeft m ";

    return result;
  }

  @override
  MovieDetail fromJson(json) {
    return MovieDetail.fromJson(json);
  }
}
