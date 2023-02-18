import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/app/app_env.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/views/top_rated/top_rated_controller.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/card_item.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';

class TopRatedView extends GetView<TopRatedController> {
  static const String route = '/top-rated';

  const TopRatedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Top Rated Movie'),
      body: Obx(
        () => SkyListView(
          emptyEnabled: controller.movies.isEmpty,
          loadingEnabled: controller.isLoading.isTrue,
          errorEnabled: controller.isError.isTrue,
          onRetry: controller.onRefresh,
          onRefresh: controller.onRefresh,
          child: ListView.builder(
            itemCount: controller.movies.length,
            itemBuilder: (context, index) {
              final movie = controller.movies[index];
              return CardItem(
                title: movie.title.toString(),
                overview: movie.overview.toString(),
                imageUrl: '${AppEnv.config.baseUrlImage}${movie.posterPath}',
                voteAverage: movie.voteAverage ?? 0,
                onTap: () {
                  Get.toNamed(DetailView.route, arguments: movie.id);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
