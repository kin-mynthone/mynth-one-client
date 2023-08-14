import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankingController extends GetxController {
  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
