import 'package:get/get.dart';
import 'package:skybase/ui/views/favorite/favorite_binding.dart';
import 'package:skybase/ui/views/favorite/favorite_view.dart';

final favoriteRoute = [
  GetPage(
    name: FavoriteView.route,
    page: () => const FavoriteView(),
    binding: FavoriteBinding(),
  ),
];
