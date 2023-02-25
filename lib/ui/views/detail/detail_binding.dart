import 'package:get/get.dart';
import 'package:skybase/data/repositories/movie_repository_impl.dart';
import 'package:skybase/data/sources/local/movie/movie_dao_impl.dart';
import 'package:skybase/data/sources/server/movie/movie_api_impl.dart';
import 'package:skybase/domain/usecases/get_detail_movie.dart';
import 'package:skybase/domain/usecases/get_recommendation_movies.dart';
import 'package:skybase/ui/views/detail/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    final repository = MovieRepositoryImpl(
      apiService: MovieApiImpl(),
      dao: MovieDaoImpl(),
    );
    Get.lazyPut(
      () => DetailController(
        getDetailMovie: GetDetailMovie(
          repository: repository,
        ),
        getRecommendationMovies: GetRecommendationMovies(
          repository: repository,
        ),
      ),
      tag: Get.arguments.toString(),
    );
  }
}
