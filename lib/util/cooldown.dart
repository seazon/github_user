import 'package:flutter/material.dart';

import 'log_plugin.dart';

class CoolDown with LogPlugin  {
  int _lastCallMs = 0;

  CoolDown(this.duration);
  final Duration duration;

  void run(VoidCallback action) {
    d("CoolDown ${duration.inMilliseconds}");
    if (DateTime.now().millisecondsSinceEpoch - _lastCallMs > duration.inMilliseconds) {
      d("CoolDown in");
      action.call();
      _lastCallMs = DateTime.now().millisecondsSinceEpoch;
    }
  }
}
