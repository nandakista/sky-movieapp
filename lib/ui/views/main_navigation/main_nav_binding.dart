import 'package:get/get.dart';
import 'package:skybase/ui/views/favorite/favorite_binding.dart';
import 'package:skybase/ui/views/home/home_binding.dart';
import 'package:skybase/ui/views/main_navigation/main_nav_controller.dart';
import 'package:skybase/ui/views/utility/utility_binding.dart';

class MainNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavController());
    HomeBinding().dependencies();
    FavoriteBinding().dependencies();
    UtilityBinding().dependencies();
  }
}
