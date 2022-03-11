import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:github_user/ui/views/githubuserlist/github_user_list_view.dart';
import 'package:github_user/ui/views/home/home_view.dart';
import 'package:github_user/ui/views/tomato/tomato_view.dart';
import 'package:github_user/ui/views/imagepicker/image_picker_view.dart';
import 'package:github_user/ui/views/location/location_view.dart';
import 'package:github_user/ui/views/tab/tab_view.dart';
import 'package:github_user/ui/views/webview/webview_view.dart';

import 'app_config.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return GetMaterialApp(
      title: config.appName,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 72.0, color: Colors.grey, fontWeight: FontWeight.w300),
          )),
      home: GithubUserListView(),
      // home: HomeView(),
      getPages: [
        GetPage(name: "/", page: () => HomeView()),
        GetPage(name: "/github-user", page: () => GithubUserListView()),
        GetPage(name: "/image-picker", page: () => ImagePickerView()),
        GetPage(name: "/location", page: () => LocationView()),
        GetPage(name: "/tab", page: () => TabView()),
        GetPage(name: "/tomato", page: () => TomatoView()),
        GetPage(name: "/webview", page: () => WebViewView()),
      ],
    );
  }
}
