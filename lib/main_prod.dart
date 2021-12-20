import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app/locator.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Flutter Demo',
    flavorName: 'prod',
    apiBaseUrl: 'https://prod-api.example.com/',
    child: const MyApp(),
  );
  debugPaintSizeEnabled = false;
  setupLocator();
  runApp(configuredApp);
}
