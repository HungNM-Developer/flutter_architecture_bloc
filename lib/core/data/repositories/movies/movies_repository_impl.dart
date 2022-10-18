import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

import '../../domain/network/service/dio_client.dart';
import '../../models/cast_list.dart';
import '../../models/genre.dart';
import '../../models/movie_detail.dart';
import '../../models/movie_generic.dart';
import '../../models/movie_image.dart';
import '../../models/person_generic.dart';
import 'moview_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final DioClient dioClient;
  MoviesRepositoryImpl(this.dioClient);

  final String baseUrl = Config.baseUrl;
  final String apiKey = 'api_key=${Config.apiKey}';

  @override
  Future<SingleResponse> getCastList(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$movieId/credits?$apiKey',
      object: Cast(),
    );
    return response;
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
    return response;
  }

  @override
  Future<SingleResponse> getMovieImage(int movieId) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$movieId/images?$apiKey',
      object: const MovieImage(),
    );
    return response;
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
  Future<SingleResponse> getYoutubeId(int id) async {
    final response = await dioClient.get(
      '$baseUrl/movie/$id/videos?$apiKey',
      object: String,
    );
    return response;
  }
}
