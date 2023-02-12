import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skybase/ui/views/utility/utility_controller.dart';
import 'package:skybase/ui/widgets/sky_button.dart';

class UtilityView extends GetView<UtilityController> {
  static const String route = '/utility';

  const UtilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              animateFromLastPercent: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: controller.progressDownload.value.abs(),
              barRadius: const Radius.circular(12),
              progressColor: Colors.green,
            ),
          ),
          const SizedBox(height: 12),
          SkyButton(
            text: 'Download file',
            onPressed: () => controller.downloadFile(),
          ),
        ],
      ),
    );
  }
}
