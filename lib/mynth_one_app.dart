import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/enums/flavor_enum.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/localization/app_translations.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';
import 'package:mynth_one_client/app/themes/app_themes.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

class MynthOneApp extends StatelessWidget {
  const MynthOneApp({
    Key? key,
    required this.flavor,
    required this.isDoneWithOnboarding,
  }) : super(key: key);

  final Flavor flavor;
  final bool isDoneWithOnboarding;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      MyLogger.printInfo('CURRENT FLAVOR: ${flavor.description}');
    }

    return DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
        title: '${flavor.title}MynthOne',
        initialRoute:
            isDoneWithOnboarding ? AppPages.SPLASH : AppPages.INTRODUCTION,
        getPages: AppPages.routes,
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: kDebugMode ? true : false,
        theme: AppThemes.darkTheme,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        translations: AppTranslations(),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          child = ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, child!),
            minWidth: 360,
            defaultName: MOBILE,
            breakpoints: [
              const ResponsiveBreakpoint.resize(360),
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(640, name: 'PHABLET'),
              const ResponsiveBreakpoint.autoScale(850, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1080, name: DESKTOP),
            ],
          );
          child = DevicePreview.appBuilder(context, child);
          return child;
        },
      ),
    );
  }
}
