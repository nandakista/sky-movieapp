import 'package:get/get.dart';
import 'package:skybase/ui/views/search/search_binding.dart';
import 'package:skybase/ui/views/search/search_view.dart';

final searchRoute = [
  GetPage(
    name: SearchView.route,
    page: () => const SearchView(),
    binding: SearchBinding(),
  ),
];
