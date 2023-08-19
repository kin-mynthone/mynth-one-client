import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum DashboardSettingsStatus {
  initial,
  loading,
  succeeded,
  failed,
  error,
  invalid
}

class DashboardSettingsController extends GetxController {
  static DashboardSettingsController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = DashboardSettingsStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _stringSample = ''.obs;

  DashboardSettingsStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get stringSample => _stringSample.value;

  bool get isLoading => _status.value == DashboardSettingsStatus.loading;
  bool get hasSucceeded => _status.value == DashboardSettingsStatus.succeeded;
  bool get hasFailed => _status.value == DashboardSettingsStatus.failed;
  bool get isInvalid => _status.value == DashboardSettingsStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'DashboardSettingsController(_status: ${_status.value},  _stringSample: ${_stringSample.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorDashboardSettingsStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorDashboardSettingsStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case DashboardSettingsStatus.error:
            MyLogger.printError(currentState());
            break;
          case DashboardSettingsStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case DashboardSettingsStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case DashboardSettingsStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case DashboardSettingsStatus.failed:
            break;
          case DashboardSettingsStatus.invalid:
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
