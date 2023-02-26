import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skybase/core/base/base_controller.dart';
import 'package:skybase/core/helper/firebase/analytics/analytics_helper.dart';
import 'package:skybase/domain/entities/movie.dart';
import 'package:skybase/domain/usecases/search_movies.dart';
import 'package:skybase/ui/views/search/search_view.dart';

class SearchController extends BaseController {
  final SearchMovies searchMovies;

  SearchController({required this.searchMovies});

  String tag = 'SearchController: ';
  final searchController = TextEditingController();
  final querySearch = ''.obs;

  final RxList<Movie> resultMovies = <Movie>[].obs;

  @override
  void onInit() {
    AnalyticsHelper().logScreen(SearchView.route);
    debounce(querySearch, (callback) {
      AnalyticsHelper().logEvent(
        name: 'search_movie',
        parameters: {
          'query': callback.toString(),
        },
      );
      loadData();
    });
    super.onInit();
  }

  @override
  void onRefresh() {
    loadData();
  }

  Future<void> loadData() async {
    try {
      showLoading();
      await searchMovies(querySearch.value).then((res) {
        hideLoading();
        resultMovies.value = res;
      });
    } catch (e) {
      hideLoading();
      showError(e.toString());
    }
  }
}
