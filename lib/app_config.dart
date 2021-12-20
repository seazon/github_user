import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    required this.appName,
    required this.flavorName,
    required this.apiBaseUrl,
    required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;
  final String apiBaseUrl;

  static AppConfig of(BuildContext context) {
    AppConfig? appConfig =
        context.dependOnInheritedWidgetOfExactType<AppConfig>();
    if (appConfig == null) {
      throw Exception("Get appp config failed");
    }
    return appConfig;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
