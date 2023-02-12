import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/utility/utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  static const String route = '/utility';
  const UtilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Utility View'),
      ),
    );
  }
}
