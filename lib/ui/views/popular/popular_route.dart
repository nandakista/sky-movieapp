import 'package:get/get.dart';
import 'package:skybase/ui/views/popular/popular_binding.dart';
import 'package:skybase/ui/views/popular/popular_view.dart';

final popularRoute = [
  GetPage(
    name: PopularView.route,
    page: () => const PopularView(),
    binding: PopularBinding(),
  ),
];
