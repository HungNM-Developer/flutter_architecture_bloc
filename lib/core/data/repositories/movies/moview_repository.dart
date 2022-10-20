import '../../domain/network/simple_reponse/simple_reponse.dart';
import '../../models/movie_credits.dart';
import '../../models/movie_image.dart';

abstract class MoviesRepository {
  Future<SingleResponse> getNowPlayingMovie();
  Future<SingleResponse> getMovieByGenre(int movieId);
  Future<SingleResponse> getGenreList();
  Future<SingleResponse> getTrendingPerson();
  Future<SingleResponse> getMovieDetail(int movieId);
  Future<String> getYoutubeId(int id);
  Future<MovieImage> getMovieImage(int movieId);
  Future<List<Cast>> getCastList(int movieId);
}
