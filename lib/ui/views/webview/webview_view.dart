import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_user/ui/views/webview/webview_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../basic_view.dart';

class WebViewView extends BasicView<WebViewViewModel> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  bool get reactive => true;

  @override
  Widget builder(BuildContext context, WebViewViewModel model, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: WebView(
        initialUrl: model.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        // TODO(iskakaushik): Remove this when collection literals makes it to stable.
        // ignore: prefer_collection_literals
        javascriptChannels: <JavascriptChannel>[
          _toasterJavascriptChannel(context),
        ].toSet(),
        navigationDelegate: (NavigationRequest request) {
          d('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          d('Page started loading: $url');
        },
        onPageFinished: (String url) {
          d('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Get.snackbar("", message.message);
        });
  }

  @override
  WebViewViewModel viewModelBuilder(BuildContext context) {
    WebViewViewModel model = WebViewViewModel();
    model.init();
    return model;
  }
}
