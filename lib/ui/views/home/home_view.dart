import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const String route = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
