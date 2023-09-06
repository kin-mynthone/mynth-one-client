import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';
import 'package:mynth_one_client/app/enums/local_auth_support_state_enum.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

enum LocalAuthStatus {
  initial,
  authenticating,
  authenticated,
  noAuthSetup,
  failed,
  error,
}

class LocalAuthController extends GetxController {
  static LocalAuthController get instance => Get.find();
  late Worker _statusEverWorker;

  Rx<LocalAuthStatus> get statusRx => _status;

  final _status = LocalAuthStatus.initial.obs;
  LocalAuthStatus get status => _status.value;

  String currentState() => 'LocalAuthController(_status: ${_status.value},';

  final LocalAuthentication auth = LocalAuthentication();

  final _supportState = LocalAuthSupportState.unknown.obs;
  LocalAuthSupportState get supportState => _supportState.value;

  final _canCheckBiometrics = false.obs;
  bool get canCheckBiometrics => _canCheckBiometrics.value;

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorLocalAuthStatus();
    auth.isDeviceSupported().then((bool isSupported) => _supportState.value =
        isSupported
            ? LocalAuthSupportState.supported
            : LocalAuthSupportState.unsupported);
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorLocalAuthStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case LocalAuthStatus.error:
            MyLogger.printError(currentState());
            break;

          case LocalAuthStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case LocalAuthStatus.failed:
            MyLogger.printInfo(currentState());

            break;
          case LocalAuthStatus.authenticating:
            MyLogger.printInfo(currentState());

            break;
          case LocalAuthStatus.authenticated:
            MyLogger.printInfo(currentState());

            break;
          case LocalAuthStatus.noAuthSetup:
            MyLogger.printInfo(currentState());

            break;
        }
      },
    );
  }

  Future<void> checkBiometrics(context) async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      MyLogger.printError(e);
    }
    if (!context.mounted) {
      return;
    }

    _canCheckBiometrics.value = canCheckBiometrics;
  }

  Future<void> authenticate(context) async {
    bool authenticated = false;
    try {
      _status.value = LocalAuthStatus.authenticating;
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      MyLogger.printError(e);
      _status.value = LocalAuthStatus.error;
      return;
    }
    if (!context.mounted) {
      return;
    }
    authenticated
        ? _status.value = LocalAuthStatus.authenticated
        : _status.value = LocalAuthStatus.failed;

    MyLogger.printInfo(authenticated.toString());
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    _status.value = LocalAuthStatus.failed;
  }

  Future<void> authenticateUser(context) async {
    await checkBiometrics(context);
    if (_canCheckBiometrics.value) {
      authenticate(context);
    } else {
      _status.value = LocalAuthStatus.noAuthSetup;
    }
  }
}


  // Future<void> getAvailableBiometrics(context) async {
  //   late List<BiometricType> availableBiometrics;
  //   try {
  //     availableBiometrics = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     availableBiometrics = <BiometricType>[];
  //     MyLogger.printError(e);
  //   }
  //   if (!context.mounted) {
  //     return;
  //   }

  //   _availableBiometrics.value = availableBiometrics;
  // }

  // Future<void> authenticateWithBiometrics(context) async {
  //   bool authenticated = false;
  //   try {
  //     _status.value = LocalAuthStatus.authenticating;

  //     authenticated = await auth.authenticate(
  //       localizedReason:
  //           'Scan your fingerprint (or face or whatever) to authenticate',
  //       options: const AuthenticationOptions(
  //         stickyAuth: true,
  //         biometricOnly: true,
  //       ),
  //     );
  //   } on PlatformException catch (e) {
  //     MyLogger.printError(e);
  //     _status.value = LocalAuthStatus.failed;

  //     return;
  //   }
  //   if (!context.mounted) {
  //     return;
  //   }
  //   authenticated
  //       ? _status.value = LocalAuthStatus.authenticated
  //       : _status.value = LocalAuthStatus.failed;

  //   _authorized.value = authenticated ? 'Authorized' : 'Not Authorized';
  // }
