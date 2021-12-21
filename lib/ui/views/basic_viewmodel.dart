import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:github_user/utils/log_plugin.dart';

class BasicViewModel extends BaseViewModel with LogPlugin {
  void showDialog({
    required String title,
    String? content,
    required String textConfirm,
    String textCancel = "",
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    Get.defaultDialog(
        title: title,
        content: content == null ? null : Text(content),
        textConfirm: textConfirm,
        textCancel: textCancel,
        onCancel: onCancel,
        onConfirm: onConfirm);
  }

  void showSnackBar({
    String? title,
    required String message,
    IconData? iconData,
    Function(dynamic)? onTap,
    bool shouldIconPulse = false,
    double barBlur = 0,
    bool isDissmissible = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(title = title ?? "", message = message,
        duration: duration, onTap: onTap);
  }
}
