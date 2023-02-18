import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/detail/detail_controller.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';

class DetailView extends GetView<DetailController> {
  static const String route = '/detail';
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Detail Movies'),
      body: Center(
        child: Text('Detail View'),
      ),
    );
  }
}
