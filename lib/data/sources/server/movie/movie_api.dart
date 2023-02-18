import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/entities/movie_detail.dart';

abstract class MovieApi {
  Future<MovieDetail> getMovieDetail({required int id});
  Future<List<Movie>> getRecommendedMovies({required int id});
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> searchMovies({required String query});
}