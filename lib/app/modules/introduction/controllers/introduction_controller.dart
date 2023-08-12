import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

class IntroductionController extends GetxController {
  void goToLogin() {
    Get.offAllNamed(AppPages.LOGIN);
  }

  bool checkSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyLogger.printInfo(brightness.toString());

    return brightness == Brightness.light;
  }
}
