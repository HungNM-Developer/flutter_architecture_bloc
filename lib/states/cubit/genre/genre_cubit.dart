import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/models/genre.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';
import '../../../di/injection.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final _moviesRepository = getIt<MoviesRepository>();

  GenreCubit() : super(GenreLoading());

  Future<void> fetchGenre() async {
    final result = await _moviesRepository.getGenreList();
    if (result.status != 'ok') emit(GenreError());
    final lstGenres =
        List<Genre>.from((result.data as GenresGeneric).genres ?? []);
    if (lstGenres.isEmpty) emit(GenreEmpty());
    emit(GenreLoaded(genreList: lstGenres));
  }
}
