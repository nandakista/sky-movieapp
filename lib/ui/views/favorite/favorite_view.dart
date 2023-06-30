import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/favorite/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  static const String route = '/favorite';
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite View'),
      ),
    );
  }
}
