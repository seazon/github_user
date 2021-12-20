import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/generated/l10n.dart';
import 'package:github_user/ui/views/githubuserlist/github_user_list_view.dart';
import 'package:github_user/ui/views/imagepicker/image_picker_view.dart';
import 'package:github_user/ui/views/location/location_view.dart';
import 'package:github_user/ui/views/tab/tab_view.dart';
import 'package:github_user/ui/views/webview/webview_view.dart';
import 'package:uni_links/uni_links.dart';

import '../../../app_config.dart';
import '../basic_view.dart';
import 'home_viewmodel.dart';

class HomeView extends BasicView<HomeViewModel> {
  final Map<String, String> map = Map();

  @override
  Widget builder(BuildContext context, HomeViewModel model, Widget? child) {
    var config = AppConfig.of(context);
    handleDeepLink(model);
    return Scaffold(
      appBar: AppBar(
        title: Text("${S.of(context).home_title} (${config.flavorName})"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text("1. Tab Layout"),
            onTap: () {
              Get.to(TabView());
            },
          ),
          ListTile(
            title: const Text("2. Github User Search"),
            onTap: () {
              Get.to(GithubUserListView());
            },
          ),
          ListTile(
            title: const Text("3. Image Picker"),
            onTap: () {
              Get.to(ImagePickerView());
            },
          ),
          ListTile(
            title: const Text("4. WebView"),
            onTap: () {
              Get.to(WebViewView(),
                  arguments: ["google", "https://google.com"]);
            },
          ),
          ListTile(
            title: const Text("5. Location"),
            onTap: () {
              Get.to(LocationView());
            },
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }

  void handleDeepLink(HomeViewModel model) {
    getInitialUri().then((Uri? url) {
      d('URL received: $url');
      if (url != null && url.scheme == 'poc') {
        map.addAll(url.queryParameters);
        if (url.path == '/github_user') {
          Get.to(GithubUserListView());
        }
      }
    });
  }
}
