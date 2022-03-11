import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'app/locator.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Flutter Demo Dev',
    flavorName: 'dev',
    apiBaseUrl: 'https://dev-api.example.com/',
    child: const MyApp(),
  );
  debugPaintSizeEnabled = false;
  setupLocator();
  runApp(configuredApp);
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
