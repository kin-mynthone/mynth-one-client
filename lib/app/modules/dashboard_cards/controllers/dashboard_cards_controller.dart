import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum DashboardCardStatus { initial, loading, succeeded, failed, error, invalid }

class DashboardCardController extends GetxController {
  static DashboardCardController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = DashboardCardStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _stringSample = ''.obs;

  DashboardCardStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get stringSample => _stringSample.value;

  bool get isLoading => _status.value == DashboardCardStatus.loading;
  bool get hasSucceeded => _status.value == DashboardCardStatus.succeeded;
  bool get hasFailed => _status.value == DashboardCardStatus.failed;
  bool get isInvalid => _status.value == DashboardCardStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'DashboardCardController(_status: ${_status.value},  _stringSample: ${_stringSample.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorDashboardCardStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorDashboardCardStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case DashboardCardStatus.error:
            MyLogger.printError(currentState());
            break;
          case DashboardCardStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case DashboardCardStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case DashboardCardStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case DashboardCardStatus.failed:
            break;
          case DashboardCardStatus.invalid:
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
