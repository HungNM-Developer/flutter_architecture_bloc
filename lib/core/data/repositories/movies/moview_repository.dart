import '../../domain/network/simple_reponse/simple_reponse.dart';

abstract class MoviesRepository {
  Future<SingleResponse> getNowPlayingMovie();
  Future<SingleResponse> getMovieByGenre(int movieId);
  Future<SingleResponse> getGenreList();
  Future<SingleResponse> getTrendingPerson();
  Future<SingleResponse> getMovieDetail(int movieId);
  Future<SingleResponse> getYoutubeId(int id);
  Future<SingleResponse> getMovieImage(int movieId);
  Future<SingleResponse> getCastList(int movieId);
}
