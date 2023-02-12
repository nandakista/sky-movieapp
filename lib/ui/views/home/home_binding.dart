import 'package:get/get.dart';
import 'package:skybase/ui/views/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}