import 'package:get/get.dart';
import 'package:skybase/ui/views/top_rated/top_rated_binding.dart';
import 'package:skybase/ui/views/top_rated/top_rated_view.dart';

final topRatedRoute = [
  GetPage(
    name: TopRatedView.route,
    page: () => const TopRatedView(),
    binding: TopRatedBinding(),
  ),
];
