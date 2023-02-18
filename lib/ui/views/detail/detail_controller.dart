import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/domain/entities/movie_detail.dart';
import 'package:skybase/domain/usecases/get_detail_movie.dart';

class DetailController extends BaseController {
  GetDetailMovie getDetailMovie;
  DetailController({required this.getDetailMovie});

  String tag = 'DetailController: ';
  final detailMovie = Rxn<MovieDetail>();

  @override
  void onRefresh() {
    loadData();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await getDetailMovie(id: Get.arguments).then((res) {
        detailMovie.value = res;
        hideLoading();
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
