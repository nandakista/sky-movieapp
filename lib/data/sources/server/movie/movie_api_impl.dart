import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/app/app_env.dart';
import 'package:skybase/core/network/api_request.dart';
import 'package:skybase/data/models/movie_detail_model.dart';
import 'package:skybase/data/models/movie_wrapper.dart';
import 'package:skybase/data/sources/server/movie/movie_api.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/entities/movie_detail.dart';

class MovieApiImpl implements MovieApi {
  String tag = 'MovieApi: ';

  @override
  Future<MovieDetail> getMovieDetail({required int id}) async {
    try {
      final res = await ApiRequest.get(
        url: '/movie/$id?api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieDetailModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final res = await ApiRequest.get(
        url: '/movie/now_playing?api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieWrapper.fromJson(res.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final res = await ApiRequest.get(
        url: '/movie/popular?api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieWrapper.fromJson(res.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getRecommendedMovies({required int id}) async {
    try {
      final res = await ApiRequest.get(
        url: '/movie/$id/recommendations?api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieWrapper.fromJson(res.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final res = await ApiRequest.get(
        url: '/movie/top_rated?api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieWrapper.fromJson(res.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Movie>> searchMovies({required String query}) async {
    try {
      final res = await ApiRequest.get(
        url: '/search/movie?query=$query&api_key=${AppEnv.config.apiKey}',
        useToken: true,
      );
      return MovieWrapper.fromJson(res.data).data;
    } catch (e) {
      rethrow;
    }
  }
}
