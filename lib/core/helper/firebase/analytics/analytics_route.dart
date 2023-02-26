import 'package:skybase/ui/views/detail/detail_view.dart';
import 'package:skybase/ui/views/favorite/favorite_view.dart';
import 'package:skybase/ui/views/home/home_view.dart';
import 'package:skybase/ui/views/intro/intro_view.dart';
import 'package:skybase/ui/views/now_playing/now_playing_view.dart';
import 'package:skybase/ui/views/popular/popular_view.dart';
import 'package:skybase/ui/views/search/search_view.dart';
import 'package:skybase/ui/views/top_rated/top_rated_view.dart';

class AnalyticsRoute {
  static final Map<String, String> name = {
    FavoriteView.route: 'Favorite',
    DetailView.route: 'Detail Movie',
    HomeView.route: 'Home',
    NowPlayingView.route: 'Now Playing Movie',
    PopularView.route: 'Popular Movie',
    SearchView.route: 'Search Movie',
    TopRatedView.route: 'Top Rated Movie',
    IntroView.route: 'Intro'
  };
}