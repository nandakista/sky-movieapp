import 'package:get/get.dart';
import 'package:skybase/data/repositories/movie_repository_impl.dart';
import 'package:skybase/data/sources/local/movie/movie_dao_impl.dart';
import 'package:skybase/data/sources/server/movie/movie_api_impl.dart';
import 'package:skybase/domain/usecases/get_top_rated_movies.dart';
import 'package:skybase/ui/views/top_rated/top_rated_controller.dart';

class TopRatedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TopRatedController(
        getTopRatedMovies: GetTopRatedMovies(
          repository: MovieRepositoryImpl(
            apiService: MovieApiImpl(),
            dao: MovieDaoImpl(),
          ),
        ),
      ),
    );
  }
}
