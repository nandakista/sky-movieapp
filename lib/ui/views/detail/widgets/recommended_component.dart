import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/detail/detail_controller.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';

class RecommendedComponent extends GetView<DetailController> {
  const RecommendedComponent({Key? key}) : super(key: key);

  @override
  String get tag => Get.arguments.toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendations',
          style: AppStyle.subtitle4,
        ),
        const Divider(),
        Obx(
          () => SizedBox(
            height: 150,
            child: SkyListView(
              emptyEnabled: controller.recommendationMovie.isEmpty,
              loadingEnabled: controller.isLoading.isTrue,
              errorEnabled: controller.isError.isTrue,
              onRetry: () {
                controller.onRefresh();
              },
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.recommendationMovie.length,
                itemBuilder: (context, index) {
                  final movie = controller.recommendationMovie[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(DetailView.route, arguments: movie.id, preventDuplicates: false);
                        // Get.toNamed(DetailView.route);
                        print('Click');
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppConfiguration.baseUrlImage}${movie.posterPath}',
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
