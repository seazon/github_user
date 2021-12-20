import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:github_user/generated/l10n.dart';
import 'package:github_user/ui/views/basic_viewmodel.dart';
import 'package:github_user/utils/countdown.dart';

class TomatoViewModel extends BasicViewModel {
  late List<int> times;
  late Timer _timer;
  Timer? _countDown;
  late int seconds;
  late int secondsMax;
  late double progress;
  late int state = 0; // 0: stop, 1: running, 2: pause
  bool showPauseButton = false;
  bool editing = false;

  void init() {
    times = <int>[];
    times.add(5);
    for (int i = 60; i < 60 * 60;) {
      times.add(i);
      i += 60;
    }
    var now = DateTime.now();
    var twoMinutes = now.add(const Duration(seconds: 5)).difference(now);
    initSub(twoMinutes.inSeconds);
  }

  void initSub(int seconds) {
    this.seconds = seconds;
    secondsMax = seconds;
    progress = (secondsMax - seconds) / secondsMax;
  }

  void onTimeChanged(int index) {
    var seconds = times[index];
    d("onTimeChanged: $seconds");
    initSub(seconds);
    _countDown?.cancel();
    _countDown = CountDown(3).run(() {}, () {
      updateEditing(false);
    });
    notifyListeners();
  }

  void updateEditing(bool editing) {
    if (state == 1) return;

    this.editing = editing;
    if (editing) {
      _countDown = CountDown(3).run(() {}, () {
        updateEditing(false);
      });
    }
    notifyListeners();
  }

  String buttonStartString() {
    if (state == 0) {
      return S.current.button_to_start;
    } else {
      return S.current.button_to_stop;
    }
  }

  String buttonPauseString() {
    if (state == 1) {
      return S.current.button_to_pause;
    } else {
      return S.current.button_to_resume;
    }
  }

  void toggleStartTimer() {
    if (state == 0) {
      startTimer();
    } else {
      cancelTimer(false);
    }
  }

  void togglePauseTimer() {
    if (state == 1) {
      cancelTimer(true);
    } else {
      startTimer();
    }
  }

  void startTimer() {
    state = 1;
    showPauseButton = true;
    //设置 1 秒回调一次
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //更新界面
      seconds--;
      progress = (secondsMax - seconds) / secondsMax;
      notifyListeners();

      if (seconds == 0) {
        //倒计时秒数为0，取消定时器
        _patternVibrate();
        _playSound();
        cancelTimer(false);
      }
    });
  }

  void cancelTimer(bool pause) {
    if (pause) {
      state = 2;
      showPauseButton = true;
    } else {
      state = 0;
      showPauseButton = false;
    }
    if (_timer != null) {
      _timer.cancel();
      // _timer = null;
    }
    if (!pause) {
      initSub(secondsMax);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer(false);
    _countDown?.cancel();
  }

  _patternVibrate() {
    for (int i = 0; i < 30; ++i) {
      HapticFeedback.vibrate();
      sleep(
        const Duration(milliseconds: 20),
      );
    }
  }

  _playSound() async {
    AudioPlayer audioPlayer = AudioPlayer();
    // int result = await audioPlayer.play("https://luan.xyz/files/audio/ambient_c_motion.mp3", isLocal: false);
    File url = await loadAsset();
    d("play ${url.path}");
    int result = await audioPlayer.play(url.path, isLocal: true);
    if (result == 1) {
      d("play successful");
    } else {
      e("play failed: $result");
    }
  }

  Future<File> loadAsset() async {
    final bytes = await rootBundle.load("audios/bugu.mp3");
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');
    return await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  }
}
