import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum ScanToPayStatus { initial, loading, succeeded, failed, error, invalid }

class ScanToPayController extends GetxController {
  static ScanToPayController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = ScanToPayStatus.initial.obs;
  final _stringSample = ''.obs;

  ScanToPayStatus get status => _status.value;
  String get stringSample => _stringSample.value;

  bool get isLoading => _status.value == ScanToPayStatus.loading;
  bool get hasSucceeded => _status.value == ScanToPayStatus.succeeded;
  bool get hasFailed => _status.value == ScanToPayStatus.failed;
  bool get isInvalid => _status.value == ScanToPayStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'ScanToPayController(_status: ${_status.value},  _stringSample: ${_stringSample.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorScanToPayStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorScanToPayStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case ScanToPayStatus.error:
            MyLogger.printError(currentState());
            break;
          case ScanToPayStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case ScanToPayStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case ScanToPayStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case ScanToPayStatus.failed:
            break;
          case ScanToPayStatus.invalid:
            break;
        }
      },
    );
  }

  void setstringSampleValue(String stringSample) {
    _stringSample.value = stringSample.trim();
    MyLogger.printInfo(currentState());
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
