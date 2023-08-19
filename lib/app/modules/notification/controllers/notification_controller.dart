import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
