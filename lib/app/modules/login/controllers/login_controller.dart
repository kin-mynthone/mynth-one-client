import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum LoginStatus { initial, loading, succeeded, failed, error, invalid }

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = LoginStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _email = ''.obs;
  final _password = ''.obs;
  final _obscuredPassword = true.obs;

  LoginStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get email => _email.value;
  String get password => _password.value;
  bool get obscuredPassword => _obscuredPassword.value;

  bool get isLoading => _status.value == LoginStatus.loading;
  bool get hasSucceeded => _status.value == LoginStatus.succeeded;
  bool get hasFailed => _status.value == LoginStatus.failed;
  bool get isInvalid => _status.value == LoginStatus.invalid;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() =>
      'LoginController(_status: ${_status.value},  _email: ${_email.value}, _password: ${_password.value}, _isObscuredPassword: ${_obscuredPassword.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorLoginStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorLoginStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case LoginStatus.error:
            MyLogger.printError(currentState());
            break;
          case LoginStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case LoginStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case LoginStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case LoginStatus.failed:
            break;
          case LoginStatus.invalid:
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
    // _status.value = LoginStatus.loading;
    try {
      goToDashboard();
    } catch (e) {
      MyLogger.printError(e);

      _status.value = LoginStatus.error;
    }
  }

  openToolTip() {
    tooltipkey.currentState?.ensureTooltipVisible();
  }

  goToForgotPassword() {}
  goToRegistration() {
    Get.toNamed(AppPages.REGISTRATION);
  }

  goToDashboard() {
    Get.offAllNamed(AppPages.DASHBOARD);
  }
}
