import 'package:get/get.dart';
import 'package:skybase/ui/views/utility/utility_binding.dart';
import 'package:skybase/ui/views/utility/utility_view.dart';

final utilityRoute = [
  GetPage(
    name: UtilityView.route,
    page: () => const UtilityView(),
    binding: UtilityBinding(),
  ),
];
