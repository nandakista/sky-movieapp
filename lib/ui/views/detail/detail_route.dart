import 'package:get/get.dart';
import 'package:skybase/ui/views/detail/detail_binding.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';

final detailRoute = [
  GetPage(
    name: DetailView.route,
    page: () => const DetailView(),
    binding: DetailBinding(),
  ),
];
