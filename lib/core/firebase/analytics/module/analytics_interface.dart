import 'package:flutter/material.dart';

abstract class AnalyticsInterface {
  Future<void> logScreen(String route, {String? prefix});

  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  });

  Future<void> logLogin(String loginMethod);

  Future<void> logRegister(String registerMethod);

  RouteObserver<ModalRoute<dynamic>> get routeObserver;
}
