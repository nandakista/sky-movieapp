import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/usecases/get_now_playing_movies.dart';

class NowPlayingController extends BaseController {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingController({required this.getNowPlayingMovies});

  String tag = 'NowPlayingController: ';
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onRefresh() {
    loadData();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getNowPlayingMovies().then((res) {
        movies.addAll(res);
        hideLoading();
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}