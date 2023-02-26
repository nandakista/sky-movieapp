import 'package:flutter/widgets.dart';
import 'module/analytics_interface.dart';
import 'module/firebase_analytics.dart';

class AnalyticsHelper {
  // Default Analytics tool
  final defaultAnalytics = FirebaseAnalyticsHelper();

  late AnalyticsInterface _analyticsHelper;

  factory AnalyticsHelper({AnalyticsInterface? analytics}) {
    return AnalyticsHelper._internal(analytics);
  }

  AnalyticsHelper._internal(AnalyticsInterface? analytics) {
    _analyticsHelper = analytics ?? defaultAnalytics;
  }

  Future<void> logScreen(String route, {String? prefix}) async {
    await _analyticsHelper.logScreen(route, prefix: prefix);
  }

  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    await _analyticsHelper.logEvent(name: name, parameters: parameters);
  }

  Future<void> logLogin(String loginMethod) async {
    await _analyticsHelper.logLogin(loginMethod);
  }

  Future<void> logRegister(String registerMethod) async {
    await _analyticsHelper.logRegister(registerMethod);
  }

  RouteObserver<ModalRoute<dynamic>> get routeObserver =>
      _analyticsHelper.routeObserver;
}
