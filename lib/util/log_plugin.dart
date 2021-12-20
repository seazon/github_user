import 'package:flutter/foundation.dart';

mixin LogPlugin {
  void d(dynamic msg) {
    if (kDebugMode) {
      if (msg is String) {
        print(msg);
      } else {
        print(msg.toString());
      }
    }
  }

  void i(dynamic msg) {
    if (kDebugMode) {
      if (msg is String) {
        print(msg);
      } else {
        print(msg.toString());
      }
    }
  }

  void e(dynamic msg) {
    if (kDebugMode) {
      if (msg is String) {
        print(msg);
      } else {
        print(msg.toString());
      }
    }
  }
}
