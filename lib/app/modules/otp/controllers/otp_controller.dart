import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum OtpStatus { initial, loading, succeeded, failed, error, invalid }

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  late Worker _statusEverWorker;

//status getter
  final _status = OtpStatus.initial.obs;
  OtpStatus get status => _status.value;
  bool get isLoading => _status.value == OtpStatus.loading;
  bool get hasSucceeded => _status.value == OtpStatus.succeeded;
  bool get hasFailed => _status.value == OtpStatus.failed;
  bool get isInvalid => _status.value == OtpStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() => 'OtpController(_status: ${_status.value},  ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorOtpStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorOtpStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case OtpStatus.error:
            MyLogger.printError(currentState());
            break;
          case OtpStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case OtpStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case OtpStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case OtpStatus.failed:
            break;
          case OtpStatus.invalid:
            break;
        }
      },
    );
  }

  void setValue(String data) {
    MyLogger.printInfo(currentState());
  }

  Future<void> eventName() async {
    // _status.value = OtpStatus.loading;
    try {} catch (e) {
      MyLogger.printError(e);

      _status.value = OtpStatus.error;
    }
  }

  goToPage() {}
}
