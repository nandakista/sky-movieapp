import 'package:get/get.dart';
import 'package:skybase/data/repositories/movie_repository_impl.dart';
import 'package:skybase/data/sources/local/movie/movie_dao_impl.dart';
import 'package:skybase/data/sources/server/movie/movie_api_impl.dart';
import 'package:skybase/domain/usecases/search_movies.dart';
import 'package:skybase/ui/views/search/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SearchController(
        searchMovies: SearchMovies(
          repository: MovieRepositoryImpl(
            apiService: MovieApiImpl(),
            dao: MovieDaoImpl(),
          ),
        ),
      ),
    );
  }
}
