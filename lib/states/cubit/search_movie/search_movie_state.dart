part of 'search_movie_cubit.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieEmpty extends SearchMovieState {
  final String message;

  const SearchMovieEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieHasData extends SearchMovieState {
  final List<Movie> searchResult;
  final int totalResult;
  final int currentPage;

  const SearchMovieHasData(
    this.searchResult,
    this.totalResult,
    this.currentPage,
  );

  @override
  List<Object> get props => [searchResult, totalResult, currentPage];
}

class SearchMovieError extends SearchMovieState {
  final String message;

  const SearchMovieError(this.message);

  @override
  List<Object> get props => [message];
}
