import 'package:get/get.dart';
import 'package:skybase/data/repositories/movie_repository_impl.dart';
import 'package:skybase/data/sources/local/movie/movie_dao_impl.dart';
import 'package:skybase/data/sources/server/movie/movie_api_impl.dart';
import 'package:skybase/domain/usecases/get_now_playing_movies.dart';
import 'package:skybase/ui/views/now_playing/now_playing_controller.dart';

class NowPlayingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NowPlayingController(
        getNowPlayingMovies: GetNowPlayingMovies(
          repository: MovieRepositoryImpl(
            apiService: MovieApiImpl(),
            dao: MovieDaoImpl(),
          ),
        ),
      ),
    );
  }
}
