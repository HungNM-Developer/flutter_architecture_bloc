part of 'genre_cubit.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreLoading extends GenreState {}

class GenreLoaded extends GenreState {
  final List<Genre> genreList;

  const GenreLoaded({required this.genreList});

  @override
  List<Object> get props => [genreList];
}

class GenreEmpty extends GenreState {}

class GenreError extends GenreState {}
