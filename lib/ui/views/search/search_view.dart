import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/views/search/search_controller.dart';
import 'package:skybase/ui/widgets/base/sky_list_view.dart';
import 'package:skybase/ui/widgets/card_item.dart';
import 'package:skybase/ui/widgets/content_wrapper.dart';
import 'package:skybase/ui/widgets/keyboard_dismisser.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_form_field.dart';

class SearchView extends GetView<SearchController> {
  static const String route = '/search';

  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: SkyAppBar.primary(title: 'Search'),
        body: ContentWrapper(
          top: true,
          marginTop: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkyFormField(
                controller: controller.searchController,
                  hint: 'Search Movie',
                  icon: CupertinoIcons.search,
                  onChanged: (query) {
                    controller.querySearch.value = query;
                  },
                  endIcon: IconButton(
                    onPressed: () {
                      controller.querySearch.value = '';
                      controller.searchController.clear();
                    },
                    icon: const Icon(Icons.close),
                  ),),
              const SizedBox(height: 16),
              Text(
                'Search Result',
                style: AppStyle.subtitle3,
              ),
              Expanded(
                child: Obx(
                  ()=> SkyListView(
                    loadingEnabled: controller.isLoading.isTrue,
                    emptyEnabled: controller.resultMovies.isEmpty,
                    errorEnabled: controller.isError.isTrue,
                    onRetry: () { controller.onRefresh(); },
                    child: ListView.builder(
                      itemCount: controller.resultMovies.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = controller.resultMovies[index];
                        return CardItem(
                          title: movie.title.toString(),
                          overview: movie.overview.toString(),
                          imageUrl: '${AppConfiguration.baseUrlImage}${movie.posterPath}',
                          voteAverage: movie.voteAverage ?? 0,
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
        ),
      ),
    );
  }
}
