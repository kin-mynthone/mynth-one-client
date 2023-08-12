import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

class SplashController extends GetxController {
  bool checkSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyLogger.printInfo(brightness.toString());

    return brightness == Brightness.light;
  }
}
