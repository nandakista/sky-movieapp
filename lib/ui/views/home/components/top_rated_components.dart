import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/app/app_env.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/views/top_rated/top_rated_controller.dart';
import 'package:skybase/ui/views/top_rated/top_rated_view.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/content_wrapper.dart';
import 'package:skybase/ui/widgets/cover_item.dart';

class TopRatedComponents extends GetView<TopRatedController> {
  const TopRatedComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentWrapper(
                child: Text(
                  'Top Rated',
                  style: AppStyle.subtitle2,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(TopRatedView.route),
                child: const ContentWrapper(
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Obx(
            () => SizedBox(
              height: 240,
              child: SkyListView(
                emptyEnabled: controller.movies.isEmpty,
                loadingEnabled: controller.isLoading.isTrue,
                errorEnabled: controller.isError.isTrue,
                onRetry: controller.onRefresh,
                onRefresh: controller.onRefresh,
                verticalSpacing: 8,
                horizontalSpacing: 0,
                imageSize: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.movies.length,
                  itemBuilder: (context, index) {
                    final movie = controller.movies[index];
                    return CoverItem(
                      imageUrl:
                          '${AppEnv.config.baseUrlImage}${movie.posterPath}',
                      onTap: () {
                        Get.toNamed(DetailView.route, arguments: movie.id);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
