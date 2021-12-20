import 'dart:async';

import 'package:flutter/material.dart';

class CountDown {
  CountDown(this._seconds);

  late Timer _timer;
  int _seconds = 0;

  Timer run(VoidCallback tic, VoidCallback finish) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds--;
      tic.call();

      if (_seconds == 0) {
        _timer.cancel();
        finish.call();
      }
    });
    return _timer;
  }
}
