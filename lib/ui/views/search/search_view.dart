import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/views/search/search_controller.dart';

class SearchView extends GetView<SearchController> {
  static const String route = '/search';
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Search View'),
      ),
    );
  }
}
