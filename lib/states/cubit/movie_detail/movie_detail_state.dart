part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail detail;

  const MovieDetailLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}
