import 'package:get/get.dart';

import '../basic_viewmodel.dart';

class WebViewViewModel extends BasicViewModel {
  late String _title;

  String get title => _title;

  late String _url;

  String get url => _url;

  void init() {
    _title = Get.arguments?[0] ?? "";
    _url = Get.arguments?[1] ?? "";
  }
}
