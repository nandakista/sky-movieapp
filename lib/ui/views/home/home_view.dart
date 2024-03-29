import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/ui/views/home/home_controller.dart';
import 'package:skybase/ui/views/search/search_view.dart';

import 'components/now_playing_components.dart';
import 'components/popular_components.dart';
import 'components/top_rated_components.dart';

class HomeView extends GetView<HomeController> {
  static const String route = '/home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfiguration.appName),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(SearchView.route);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NowPlayingComponents(),
                SizedBox(height: 4),
                Divider(thickness: 1, height: 24),
                PopularComponents(),
                SizedBox(height: 4),
                Divider(thickness: 1, height: 24),
                TopRatedComponents(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
