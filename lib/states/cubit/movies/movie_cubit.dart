import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_bloc/core/data/models/movie_generic.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';

import '../../../core/data/models/movie.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final _moviesRepository = getIt<MoviesRepository>();

  MovieCubit() : super(MovieLoading());

  Future<void> fetchNowPlayingMovie() async {
    final result = await _moviesRepository.getNowPlayingMovie();
    if (result.status != 'ok') emit(MovieError());
    final lstMovies =
        List<Movie>.from((result.data as MovieGeneric).results ?? []);
    if (lstMovies.isEmpty) emit(MovieLoadEmpty());
    emit(MovieLoaded(movieList: lstMovies));
  }
}
