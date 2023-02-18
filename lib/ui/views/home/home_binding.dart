import 'package:get/get.dart';
import 'package:skybase/ui/views/now_playing/now_playing_binding.dart';
import 'package:skybase/ui/views/popular/popular_binding.dart';
import 'package:skybase/ui/views/top_rated/top_rated_binding.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    NowPlayingBinding().dependencies();
    PopularBinding().dependencies();
    TopRatedBinding().dependencies();
  }
}
