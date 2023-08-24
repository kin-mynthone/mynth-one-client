import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum QrScannerStatus { initial, loading, succeeded, failed, error, invalid }

class QrScannerController extends GetxController {
  static QrScannerController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = QrScannerStatus.initial.obs;
  final _stringSample = ''.obs;

  QrScannerStatus get status => _status.value;
  String get stringSample => _stringSample.value;

  bool get isLoading => _status.value == QrScannerStatus.loading;
  bool get hasSucceeded => _status.value == QrScannerStatus.succeeded;
  bool get hasFailed => _status.value == QrScannerStatus.failed;
  bool get isInvalid => _status.value == QrScannerStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'QrScannerController(_status: ${_status.value},  _stringSample: ${_stringSample.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorQrScannerStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorQrScannerStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case QrScannerStatus.error:
            MyLogger.printError(currentState());
            break;
          case QrScannerStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case QrScannerStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case QrScannerStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case QrScannerStatus.failed:
            break;
          case QrScannerStatus.invalid:
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
