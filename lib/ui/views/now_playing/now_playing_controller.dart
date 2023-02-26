import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/core/helper/firebase/analytics/analytics_helper.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/usecases/get_now_playing_movies.dart';

import 'now_playing_view.dart';

class NowPlayingController extends BaseController {
  final GetNowPlayingMovies getNowPlayingMovies;
  NowPlayingController({required this.getNowPlayingMovies});

  String tag = 'NowPlayingController: ';
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    loadData();
    AnalyticsHelper().logScreen(NowPlayingView.route);
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