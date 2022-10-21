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
    result.fold(success: (response) {
      emit(MovieDetailLoaded(detail: response.data as MovieDetail));
    }, error: (error) {
      emit(MovieDetailError());
    });
  }
}
