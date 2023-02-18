import 'package:get/get.dart';
import 'package:skybase/ui/views/search/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}