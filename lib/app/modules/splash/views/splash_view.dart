import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_indicator.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              controller.checkSystemTheme(context)
                  ? AssetPath.lightLogo1
                  : AssetPath.darkLogo1,
            ),
            const SizedBox(
              height: 30,
            ),
            LoadingIndicator(
              color: controller.checkSystemTheme(context)
                  ? AppColors.lightPrimary
                  : AppColors.darkSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
