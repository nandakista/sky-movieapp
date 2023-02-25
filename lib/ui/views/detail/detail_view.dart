import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/ui/views/detail/detail_controller.dart';
import 'package:skybase/ui/widgets/base/sky_view.dart';
import 'package:skybase/ui/widgets/colored_status_bar.dart';
import 'package:skybase/ui/widgets/sky_button.dart';

import 'widgets/detail_content_view.dart';
import 'widgets/recommended_component.dart';

class DetailView extends GetView<DetailController> {
  static const String route = '/detail';

  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredStatusBar(
      color: Colors.black,
      brightness: Brightness.light,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          bottom: false,
          child: SkyButton(
            margin: const EdgeInsets.all(12),
            text: 'Add to favorite',
            onPressed: () {
              //
            },
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Obx(
                () => SkyView(
                  loadingEnabled: controller.isLoading.isTrue,
                  errorEnabled: controller.isError.isTrue,
                  onRetry: () {
                    controller.onRefresh();
                  },
                  child: DetailContent(
                    key: const Key('detail_content'),
                    imageUrl:
                        '${AppConfiguration.baseUrlImage}${controller.detailMovie.value?.backdropPath}',
                    title: '${controller.detailMovie.value?.title}',
                    status: '${controller.detailMovie.value?.status}',
                    overview: '${controller.detailMovie.value?.overview}',
                    runtime: controller.detailMovie.value?.runtime ?? 0,
                    genres: controller.detailMovie.value?.genres ?? [],
                    voteAverage: controller.detailMovie.value?.voteAverage ?? 0,
                    voteCount: controller.detailMovie.value?.voteCount ?? 0,
                    recommendedView: const RecommendedComponent(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                foregroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
