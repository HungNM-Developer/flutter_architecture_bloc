part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movieList;
  const MovieLoaded({required this.movieList});

  @override
  List<Object> get props => [movieList];
}

class MovieLoadEmpty extends MovieState {}

class MovieError extends MovieState {}
