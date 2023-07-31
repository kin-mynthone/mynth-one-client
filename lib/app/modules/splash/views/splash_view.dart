import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/modules/splash/controllers/splash_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_indicator.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: LoadingIndicator(
            color: AppColors.h4A495E,
          ),
        ),
      ),
    );
  }
}
