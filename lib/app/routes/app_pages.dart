import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:mynth_one_client/app/modules/introduction/views/introduction_view.dart';

import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const SPLASH = Routes.SPLASH;
  static const INTRODUCTION = Routes.INTRODUCTION;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      binding: IntroductionBinding(),
    ),
  ];
}
