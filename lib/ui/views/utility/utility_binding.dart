import 'package:get/get.dart';
import 'package:skybase/ui/views/utility/utility_controller.dart';

class UtilityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UtilityController());
  }
}