import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';
import 'package:flutter_architecture_bloc/core/data/models/movie_credits.dart';
import '../../domain/network/service/dio_client.dart';
import '../../models/genre.dart';
import '../../models/movie_detail.dart';
import '../../models/movie_generic.dart';
import '../../models/movie_image.dart';
import '../../models/person_generic.dart';
import '../../models/youtube.dart';
import 'moview_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final DioClient dioClient;
  MoviesRepositoryImpl(this.dioClient);

  final String baseUrl = Enviroment.apiUrl;
  final String apiKey = 'api_key=${Enviroment.apiKey_1}';

  @override
  Future<List<Cast>> getCastList(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$movieId/credits?$apiKey',
      object: MovieCredits(),
    );
    List<Cast> castList = (response.data as MovieCredits).cast ?? [];

    return castList;
  }

  @override
  Future<SingleResponse> getGenreList() async {
    final response = await dioClient.get(
      '$baseUrl/genre/movie/list?$apiKey',
      object: GenresGeneric(),
    );
    return response;
  }

  @override
  Future<SingleResponse> getMovieByGenre(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/discover/movie?with_genres=$movieId&$apiKey',
      object: MovieGeneric(),
    );
    return response;
  }

  @override
  Future<SingleResponse> getMovieDetail(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$movieId?$apiKey',
      object: MovieDetail(),
    );
    MovieDetail movieDetail = response.data;
    movieDetail.trailerId = await getYoutubeId(movieId);

    movieDetail.movieImage = await getMovieImage(movieId);

    movieDetail.castList = await getCastList(movieId);
    return response;
  }

  @override
  Future<MovieImage> getMovieImage(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$movieId/images?$apiKey',
      object: MovieImage(),
    );
    var result = response.data;
    return result;
  }

  @override
  Future<SingleResponse> getNowPlayingMovie() async {
    final response = await dioClient.get(
      '$baseUrl/movie/now_playing?$apiKey',
      object: MovieGeneric(),
    );
    return response;
  }

  @override
  Future<SingleResponse> getTrendingPerson() async {
    final response = await dioClient.get(
      '$baseUrl/trending/person/week?$apiKey',
      object: PersonGeneric(),
    );
    return response;
  }

  @override
  Future<String> getYoutubeId(int id) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$id/videos?$apiKey',
      object: Youtube(),
    );

    String youtubeId = (response.data as Youtube).results!.isNotEmpty
        ? (response.data as Youtube).results?.first.key ?? ''
        : '';
    return youtubeId;
  }

  @override
  Future<SingleResponse> searchMovie(String keyword, int page) async {
    final response = await dioClient.get(
      '$baseUrl/search/movie?$apiKey&page=$page&query=$keyword',
      object: MovieGeneric(),
    );
    return response;
  }

  @override
  Future<SingleResponse> getPopularMovie() async {
    final response = await dioClient.get(
      '$baseUrl/movie/popular?$apiKey',
      object: MovieGeneric(),
    );
    return response;
  }

  @override
  Future<SingleResponse> getTopRatedMovie() async {
    final response = await dioClient.get(
      '$baseUrl/movie/top_rated?$apiKey',
      object: MovieGeneric(),
    );
    return response;
  }
}
