import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:screenshot/screenshot.dart';

enum PersonalQrCodeStatus {
  initial,
  loading,
  succeeded,
  failed,
  error,
  invalid
}

class PersonalQrCodeController extends GetxController {
  static PersonalQrCodeController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = PersonalQrCodeStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _screenshotController = ScreenshotController();
  final _qrData =
      'liM2dqnyL4ntkmEkWIzLXowc3AxldsGfw5oFYj3y3MHAxHsz3msS4RfpDkiF9HkCIVDstmN1YJ9NZlAN'
          .obs;

  PersonalQrCodeStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get qrData => _qrData.value;
  ScreenshotController get screenshotController => _screenshotController;

  bool get isLoading => _status.value == PersonalQrCodeStatus.loading;
  bool get hasSucceeded => _status.value == PersonalQrCodeStatus.succeeded;
  bool get hasFailed => _status.value == PersonalQrCodeStatus.failed;
  bool get isInvalid => _status.value == PersonalQrCodeStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'PersonalQrCodeController(_status: ${_status.value},  _qrData: ${_qrData.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorPersonalQrCodeStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorPersonalQrCodeStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case PersonalQrCodeStatus.error:
            MyLogger.printError(currentState());
            break;
          case PersonalQrCodeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case PersonalQrCodeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case PersonalQrCodeStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case PersonalQrCodeStatus.failed:
            break;
          case PersonalQrCodeStatus.invalid:
            break;
        }
      },
    );
  }

  void setqrDataValue(String qrData) {
    _qrData.value = qrData.trim();
    MyLogger.printInfo(currentState());
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
