import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';
import 'package:flutter_architecture_bloc/core/data/models/movie_generic.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';

import '../../../core/data/models/movie.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final _moviesRepository = getIt<MoviesRepository>();

  MovieCubit() : super(MovieLoading());

  final int page = 1;
  bool isSearched = false;
  late String keywordSearch;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchNowPlayingMovie(int movieId, String query) async {
    final SingleResponse result;
    if (movieId == 0) {
      result = await _moviesRepository.getNowPlayingMovie();
    } else {
      result = await _moviesRepository.getMovieByGenre(movieId);
    }
    result.fold(success: (response) {
      final lstMovies =
          List<Movie>.from((response.data as MovieGeneric).results ?? []);
      if (lstMovies.isEmpty) emit(MovieLoadEmpty());
      emit(MovieLoaded(movieList: lstMovies));
    }, error: (error) {
      emit(MovieError());
    });
  }

  Future<void> fetchPopularMovie() async {
    final result = await _moviesRepository.getPopularMovie();

    result.fold(success: (response) {
      final lstMovies =
          List<Movie>.from((response.data as MovieGeneric).results ?? []);
      if (lstMovies.isEmpty) emit(MovieLoadEmpty());
      emit(MovieLoaded(movieList: lstMovies));
    }, error: (error) {
      emit(MovieError());
    });
  }

  Future<void> fetchTopRatedMovie() async {
    final result = await _moviesRepository.getTopRatedMovie();

    result.fold(success: (response) {
      final lstMovies =
          List<Movie>.from((response.data as MovieGeneric).results ?? []);
      if (lstMovies.isEmpty) emit(MovieLoadEmpty());
      emit(MovieLoaded(movieList: lstMovies));
    }, error: (error) {
      emit(MovieError());
    });
  }
}
