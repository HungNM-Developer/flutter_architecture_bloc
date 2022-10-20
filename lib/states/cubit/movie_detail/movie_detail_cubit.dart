import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_bloc/core/data/models/movie_detail.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/movies/moview_repository.dart';

import '../../../di/injection.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailLoading());
  final _moviesRepository = getIt<MoviesRepository>();

  Future<void> fetchMovieDetail(int id) async {
    final result = await _moviesRepository.getMovieDetail(id);
    if (result.status != 'ok') emit(MovieDetailError());
    final movieDetail = result.data as MovieDetail;
    //if (lstGenres.isEmpty) emit(GenreEmpty());
    emit(MovieDetailLoaded(detail: movieDetail));
  }
}
