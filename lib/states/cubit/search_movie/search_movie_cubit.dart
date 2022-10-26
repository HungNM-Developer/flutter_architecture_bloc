import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture_bloc/core/data/models/movie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/data/models/movie_generic.dart';
import '../../../core/data/repositories/movies/moview_repository.dart';
import '../../../di/injection.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  final RefreshController refreshController = RefreshController();
  final _moviesRepository = getIt<MoviesRepository>();
  SearchMovieCubit() : super(SearchMovieInitial());

  int _page = 1;
  bool _hasNext = false;

  bool get hasNext => _hasNext;

  final List<Movie> _listMovies = [];
  String _query = '';

  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }

  Future<void> searchMovie({String keyword = '', bool isRefresh = true}) async {
    _query = keyword;
    if (_query.isEmpty) {
      emit(SearchMovieInitial());
    } else {
      if (isRefresh) {
        _page = 1;
        _hasNext = false;
        await Future.delayed(const Duration(milliseconds: 300));
      }
      final result = await _moviesRepository.searchMovie(_query, _page);
      result.fold(success: (response) {
        final lstMoviesData = List<Movie>.from(
          (response.data as MovieGeneric).results ?? [],
        );
        if (isRefresh) {
          _listMovies.clear();
        }
        _listMovies.addAll(lstMoviesData);
        _hasNext =
            _listMovies.length < (response.data as MovieGeneric).totalResults!;
        final totalResults = (response.data as MovieGeneric).totalResults ?? 0;
        if (_listMovies.isEmpty) {
          emit(const SearchMovieEmpty('No Data'));
        } else {
          emit(SearchMovieHasData(_listMovies, totalResults, _page));
        }
      }, error: (error) {
        emit(SearchMovieError(error));
      });
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    _hasNext = false;
    final result = await _moviesRepository.searchMovie(_query, _page);
    result.fold(success: (response) {
      final lstMoviesData = List<Movie>.from(
        (response.data as MovieGeneric).results ?? [],
      );
      _listMovies.clear();
      _listMovies.addAll(lstMoviesData);
      _hasNext =
          _listMovies.length < (response.data as MovieGeneric).totalResults!;
      final totalResults = (response.data as MovieGeneric).totalResults ?? 0;
      if (_listMovies.isEmpty) {
        emit(const SearchMovieEmpty('No Data'));
      } else {
        emit(SearchMovieHasData(_listMovies, totalResults, _page));
      }
    }, error: (error) {
      emit(SearchMovieError(error));
    });
  }

  void clearSearch() {}
  void onLoadMore() {
    _page++;
    searchMovie(keyword: _query, isRefresh: false);
  }
}
