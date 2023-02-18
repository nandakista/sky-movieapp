import 'package:get/get.dart';
import 'package:skybase/ui/views/now_playing/now_playing_binding.dart';
import 'package:skybase/ui/views/now_playing/now_playing_view.dart';

final nowPlayingRoute = [
  GetPage(
    name: NowPlayingView.route,
    page: () => const NowPlayingView(),
    binding: NowPlayingBinding(),
  ),
];
