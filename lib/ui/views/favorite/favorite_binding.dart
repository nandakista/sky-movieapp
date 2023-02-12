import 'package:get/get.dart';
import 'package:skybase/ui/views/favorite/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}