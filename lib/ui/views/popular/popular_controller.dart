import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/core/firebase/analytics/analytics_helper.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/usecases/get_popular_movies.dart';

import 'popular_view.dart';

class PopularController extends BaseController {
  final GetPopularMovies getPopularMovies;
  PopularController({required this.getPopularMovies});

  String tag = 'PopularController: ';
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    loadData();
    AnalyticsHelper().logScreen(PopularView.route);
    super.onInit();
  }

  @override
  void onRefresh() {
    loadData();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getPopularMovies().then((res) {
        movies.addAll(res);
        hideLoading();
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
