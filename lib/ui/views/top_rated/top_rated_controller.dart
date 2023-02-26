import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/core/helper/firebase/analytics/analytics_helper.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/usecases/get_top_rated_movies.dart';
import 'package:skybase/ui/views/popular/popular_view.dart';

class TopRatedController extends BaseController {
  GetTopRatedMovies getTopRatedMovies;
  TopRatedController({required this.getTopRatedMovies});

  String tag = 'TopRatedController: ';
  final RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    AnalyticsHelper().logScreen(PopularView.route);
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
      await getTopRatedMovies().then((res) {
        movies.addAll(res);
        hideLoading();
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
