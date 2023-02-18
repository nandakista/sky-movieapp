import 'package:get/get.dart';
import 'package:skybase/data/repositories/movie_repository_impl.dart';
import 'package:skybase/data/sources/local/movie/movie_dao_impl.dart';
import 'package:skybase/data/sources/server/movie/movie_api_impl.dart';
import 'package:skybase/domain/usecases/get_popular_movies.dart';
import 'package:skybase/ui/views/popular/popular_controller.dart';

class PopularBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PopularController(
        getPopularMovies: GetPopularMovies(
          repository: MovieRepositoryImpl(
            apiService: MovieApiImpl(),
            dao: MovieDaoImpl(),
          ),
        ),
      ),
    );
  }
}
