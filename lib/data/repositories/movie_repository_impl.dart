import 'package:skybase/data/sources/local/movie/movie_dao.dart';
import 'package:skybase/data/sources/server/movie/movie_api.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/entities/movie_detail.dart';
import 'package:skybase/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi apiService;
  final MovieDao dao;
  MovieRepositoryImpl({required this.apiService, required this.dao});

  String tag = 'MovieRepository : ';

  @override
  Future<MovieDetail> getDetailMovie({required int id}) {
    return apiService.getMovieDetail(id: id);
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() {
    return apiService.getNowPlayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() {
    return apiService.getPopularMovies();
  }

  @override
  Future<List<Movie>> getRecommendedMovies({required int id}) {
    return apiService.getRecommendedMovies(id: id);
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return apiService.getTopRatedMovies();
  }

  @override
  Future<List<Movie>> searchMovies({required String query}) {
    return apiService.searchMovies(query: query);
  }
}