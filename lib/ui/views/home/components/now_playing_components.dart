import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/app/app_env.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/views/now_playing/now_playing_controller.dart';
import 'package:skybase/ui/views/now_playing/now_playing_view.dart';
import 'package:skybase/ui/views/popular/popular_view.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/content_wrapper.dart';

import '../../../widgets/cover_item.dart';

class NowPlayingComponents extends GetView<NowPlayingController> {
  const NowPlayingComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContentWrapper(
                child: Text(
                  'Now Playing',
                  style: AppStyle.subtitle2,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(NowPlayingView.route),
                child: const ContentWrapper(
                  child: Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Obx(
            () => SizedBox(
              height: 500,
              child: SkyListView(
                emptyEnabled: controller.movies.isEmpty,
                loadingEnabled: controller.isLoading.isTrue,
                errorEnabled: controller.isError.isTrue,
                onRetry: controller.onRefresh,
                onRefresh: controller.onRefresh,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.movies.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisExtent: 180,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final movie = controller.movies[index];
                    return CoverItem(
                      imageUrl:
                          '${AppEnv.config.baseUrlImage}${movie.posterPath}',
                      onTap: () {
                        Navigator.pushNamed(context, DetailView.route,
                            arguments: movie.id);
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
