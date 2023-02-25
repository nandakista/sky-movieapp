import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/entities/movie_detail.dart';
import 'package:skybase/domain/usecases/get_detail_movie.dart';
import 'package:skybase/domain/usecases/get_recommendation_movies.dart';

class DetailController extends BaseController {
  GetDetailMovie getDetailMovie;
  GetRecommendationMovies getRecommendationMovies;

  DetailController({
    required this.getDetailMovie,
    required this.getRecommendationMovies,
  });

  String tag = 'DetailController: ';
  final detailMovie = Rxn<MovieDetail>();
  final RxList<Movie> recommendationMovie = <Movie>[].obs;
  late int idArgs;

  @override
  void onInit() {
    idArgs = Get.arguments;
    loadData();
    loadRecommendationMovie();
    super.onInit();
  }

  @override
  void onRefresh() {
    loadData();
    loadRecommendationMovie();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getDetailMovie(id: idArgs).then((res) {
        detailMovie.value = res;
        hideLoading();
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }

  loadRecommendationMovie() async {
    try {
      showLoading();
      await getRecommendationMovies(id: idArgs).then((res) {
        hideLoading();
        recommendationMovie.addAll(res);
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
