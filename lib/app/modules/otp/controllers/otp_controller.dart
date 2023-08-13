import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum OtpStatus {
  initial,
  loading,
  succeeded,
  expired,
  invalid,
  error,
  rejected
}

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  static const _waitingTimeForResend = 59;

  late Worker _statusEverWorker;

  final _otpSent = ''.obs;
  final _otpInput = ''.obs;
  final _secondsRemaining = _waitingTimeForResend.obs;
  final _resendEnabled = false.obs;
  late Timer _timer;

//status getter
  OtpStatus get status => _status.value;

  final _status = OtpStatus.initial.obs;
  bool get isLoading => _status.value == OtpStatus.loading;
  bool get hasSucceeded => _status.value == OtpStatus.succeeded;
  bool get isInvalid => _status.value == OtpStatus.invalid;
  bool get isExpired => _status.value == OtpStatus.expired;
  bool get isError => _status.value == OtpStatus.error;
  bool get isRejected => _status.value == OtpStatus.rejected;

  String get otpSent => _otpSent.value;
  String get otpInput => _otpInput.value;
  int get secondsRemaining => _secondsRemaining.value;
  bool get resendEnabled => _resendEnabled.value;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() => 'OtpController(_status: ${_status.value},  ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorOtpStatus();
  }

  @override
  void onReady() {
    super.onReady();
    requestOtp();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    _timer.cancel();

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
            _loginViaEmailAndPassword();
            break;
          case OtpStatus.expired:
            MyLogger.printInfo(currentState());
            break;
          case OtpStatus.invalid:
            MyLogger.printInfo(currentState());
            break;
          case OtpStatus.rejected:
            MyLogger.printInfo(currentState());
            break;
        }
      },
    );
  }

  goToDashboard() {
    Get.offAllNamed(AppPages.DASHBOARD);
  }

  Future<void> _loginViaEmailAndPassword() async {
    try {
      goToDashboard();
    } catch (e) {
      MyLogger.printError(e);
    }
  }

  Future<void> requestOtp() async {
    try {
      _startCountdown();
    } on Exception catch (e) {
      MyLogger.printError(e);
      setResendEnabledValue(true);
    } catch (_) {}
  }

  void _startCountdown() {
    _secondsRemaining.value = _waitingTimeForResend;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      MyLogger.printInfo('TIMER RUNNING EVERY SECOND');
      MyLogger.printInfo('SECONDS REMAINING ${_secondsRemaining.value}');
      if (_secondsRemaining.value != 0) {
        _secondsRemaining.value--;
      } else {
        _timer.cancel();
        MyLogger.printInfo('TIMER HAS STOPPED');
        _resendEnabled.value = true;
        MyLogger.printInfo(currentState());
      }
    });
  }

  void setResendEnabledValue(bool value) {
    _resendEnabled.value = value;
    MyLogger.printInfo(currentState());
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  void setOtpInputValue(String otpInput) {
    _otpInput.value = otpInput.trim();
    if (_otpInput.value.length == 4) {
      verifyOtp();
    }
    MyLogger.printInfo(currentState());
  }

  void resetOtpInputValue() {
    _otpInput.value = '';
    MyLogger.printInfo(currentState());
  }

  Future<OtpStatus> verifyOtp() async {
    // _status.value = OtpStatus.loading;
    //todo add loading

    try {
      print('asdadasd ' + _otpInput.value);

      if (_otpInput.value.length != 4) {
        return _status.value = OtpStatus.invalid;
      }
      if (_secondsRemaining.value == 0) {
        return _status.value = OtpStatus.expired;
      }
      if (_otpInput.value != '1234') {
        //todo change this to real condition  ---> _otpInput.value != _otpSent.value
        return _status.value = OtpStatus.rejected;
      }
      print('asdadasd ' + _otpInput.value);

      await Future.delayed(const Duration(seconds: 1));
      _timer.cancel();
      return _status.value = OtpStatus.succeeded;
    } on Exception catch (e) {
      MyLogger.printError(e);
      return _status.value = OtpStatus.error;
    } catch (e) {
      MyLogger.printError(e);
      return _status.value = OtpStatus.error;
    }
  }

  String getphoneNumber() {
    var split = '+3197010281513'.split('+31');

    return '+31 ${split[1].replaceRange(0, 7, '*****')}';
  }
}
