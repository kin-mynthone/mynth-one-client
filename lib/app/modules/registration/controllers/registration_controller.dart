import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum RegistrationStatus { initial, loading, succeeded, failed, error, invalid }

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = RegistrationStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _email = ''.obs;
  final _password = ''.obs;
  final _obscuredPassword = true.obs;

  RegistrationStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get email => _email.value;
  String get password => _password.value;
  bool get obscuredPassword => _obscuredPassword.value;

  bool get isLoading => _status.value == RegistrationStatus.loading;
  bool get hasSucceeded => _status.value == RegistrationStatus.succeeded;
  bool get hasFailed => _status.value == RegistrationStatus.failed;
  bool get isInvalid => _status.value == RegistrationStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'RegistrationController(_status: ${_status.value},  _email: ${_email.value}, _password: ${_password.value}, _isObscuredPassword: ${_obscuredPassword.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorRegistrationStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorRegistrationStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case RegistrationStatus.error:
            MyLogger.printError(currentState());
            break;
          case RegistrationStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case RegistrationStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case RegistrationStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case RegistrationStatus.failed:
            break;
          case RegistrationStatus.invalid:
            break;
        }
      },
    );
  }

  void setEmailValue(String email) {
    _email.value = email.trim();
    MyLogger.printInfo(currentState());
  }

  void setPasswordValue(String password) {
    _password.value = password.trim();
    MyLogger.printInfo(currentState());
  }

  void toggleObscuredPasswordValue() {
    _obscuredPassword.value = !_obscuredPassword.value;
    MyLogger.printInfo(currentState());
  }

  Future<void> checkIfCredentialsAreValid() async {
    // _status.value = RegistrationStatus.loading;
    try {
      goToDashboard();
    } catch (e) {
      MyLogger.printError(e);

      _status.value = RegistrationStatus.error;
    }
  }

  openToolTip() {
    tooltipkey.currentState?.ensureTooltipVisible();
  }

  goToDashboard() {
    Get.offAllNamed(AppPages.DASHBOARD);
  }
}
