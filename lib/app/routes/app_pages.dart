// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/card_info/bindings/card_info_binding.dart';
import 'package:mynth_one_client/app/modules/card_info/views/card_info_view.dart';
import 'package:mynth_one_client/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:mynth_one_client/app/modules/dashboard/views/dashboard_view.dart';
import 'package:mynth_one_client/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:mynth_one_client/app/modules/introduction/views/introduction_view.dart';
import 'package:mynth_one_client/app/modules/login/bindings/login_binding.dart';
import 'package:mynth_one_client/app/modules/login/views/login_view.dart';
import 'package:mynth_one_client/app/modules/otp/bindings/otp_binding.dart';
import 'package:mynth_one_client/app/modules/otp/views/otp_view.dart';
import 'package:mynth_one_client/app/modules/qr_scanner/bindings/qr_scanner_binding.dart';
import 'package:mynth_one_client/app/modules/qr_scanner/views/qr_scanner_view.dart';
import 'package:mynth_one_client/app/modules/registration/bindings/registration_binding.dart';
import 'package:mynth_one_client/app/modules/registration/views/registration_view.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const SPLASH = Routes.SPLASH;
  static const INTRODUCTION = Routes.INTRODUCTION;
  static const LOGIN = Routes.LOGIN;
  static const REGISTRATION = Routes.REGISTRATION;
  static const QRSCANNER = Routes.QRSCANNER;

  static const OTP = Routes.OTP;

  static const DASHBOARD = Routes.DASHBOARD;
  static const CARDINFO = Routes.CARDINFO;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.CARDINFO,
      page: () => const CardInfoView(),
      binding: CardInfoBinding(),
      transition: Transition.rightToLeftWithFade,
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.QRSCANNER,
      page: () => const QrScannerView(),
      binding: QrScannerBinding(),
      transition: Transition.rightToLeftWithFade,
      fullscreenDialog: true,
    ),
  ];
}
