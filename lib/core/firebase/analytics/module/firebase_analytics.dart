import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:skybase/core/firebase/analytics/analytics_route.dart';

import 'analytics_interface.dart';

class FirebaseAnalyticsHelper implements AnalyticsInterface {
  late FirebaseAnalytics _analytics;

  FirebaseAnalyticsHelper() {
    _analytics = FirebaseAnalytics.instance;
  }

  @override
  Future<void> logScreen(String route, {String? prefix}) async {
    debugPrint(
        "Log Route: $route\nLog Screen: ${prefix ?? ""} ${AnalyticsRoute.name[route]}");
    await _analytics.logScreenView(
      screenName: "${prefix ?? ""} ${AnalyticsRoute.name[route]}".trim(),
    );
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    debugPrint("Log Event: $name\nParameters: $parameters");
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> logLogin(String loginMethod) async {
    debugPrint("Log Login: $loginMethod");
    await _analytics.logLogin(loginMethod: loginMethod);
  }

  @override
  Future<void> logRegister(String registerMethod) async {
    debugPrint("Log Sign Up: $registerMethod");
    await _analytics.logSignUp(signUpMethod: registerMethod);
  }

  @override
  RouteObserver<ModalRoute> get routeObserver {
    return FirebaseAnalyticsObserver(
      analytics: _analytics,
      nameExtractor: (settings) => AnalyticsRoute.name[settings.name],
    );
  }
}
