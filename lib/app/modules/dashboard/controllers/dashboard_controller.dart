import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  late Worker _currentIndexEverWorker;

  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  String currentState() =>
      'DashboardController(_currentIndex: ${_currentIndex.value})';

  @override
  void onInit() {
    super.onInit();

    MyLogger.printInfo(currentState());
    _monitorCurrentIndex();
  }

  @override
  void onClose() {
    _currentIndexEverWorker.dispose();
    super.onClose();
  }

  void _monitorCurrentIndex() {
    _currentIndexEverWorker = ever(_currentIndex, (value) {
      switch (value) {
        case 0:
          MyLogger.printInfo(currentState());
          break;
        case 1:
          MyLogger.printInfo(currentState());
          break;
        case 2:
          MyLogger.printInfo(currentState());
          break;
        case 3:
          MyLogger.printInfo(currentState());
          break;
        case 4:
          MyLogger.printInfo(currentState());
          break;
      }
    });
  }

  void setCurrentIndexValue(int index) => _currentIndex.value = index;

  bool checkSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyLogger.printInfo(brightness.toString());

    return brightness == Brightness.light;
  }
}
