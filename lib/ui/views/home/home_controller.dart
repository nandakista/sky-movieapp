import 'package:get/get.dart';
import 'package:skybase/ui/views/now_playing/now_playing_controller.dart';
import 'package:skybase/ui/views/popular/popular_controller.dart';
import 'package:skybase/ui/views/top_rated/top_rated_controller.dart';

class HomeController extends GetxController {
  final popularController = Get.find<PopularController>();
  final topRatedController = Get.find<TopRatedController>();
  final nowPlayingController = Get.find<NowPlayingController>();

  Future<void> onRefresh() async {
    popularController.onRefresh();
    topRatedController.onRefresh();
    nowPlayingController.onRefresh();
  }
}
