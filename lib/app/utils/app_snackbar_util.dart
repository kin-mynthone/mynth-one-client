import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AppSnackbar {
  static void showSuccessInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'well done'.tr,
      message,
      icon: const Icon(LineIcons.check),
    );
  }

  static void showWarningInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'warning'.tr,
      message,
      icon: const Icon(LineIcons.exclamationTriangle),
    );
  }

  static void showErrorInfo({
    String? title,
    required String message,
  }) {
    Get.snackbar(
      title ?? 'error'.tr,
      message,
      icon: const Icon(LineIcons.times),
    );
  }
}
