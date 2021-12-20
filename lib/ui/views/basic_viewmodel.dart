import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:github_user/utils/log_plugin.dart';

class BasicViewModel extends BaseViewModel with LogPlugin {
  void showDialog({
    String? title,
    required String description,
    String cancelTitle = "",
    String buttonTitle = 'Ok',
    Function? onTap,
    Function? onCancelTap,
  }) async {
    Get.defaultDialog(
        title: title ?? "",
        content: Text(description),
        textCancel: cancelTitle,
        textConfirm: buttonTitle,
        onCancel: onCancelTap?.call(),
        onConfirm: onTap?.call());
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
