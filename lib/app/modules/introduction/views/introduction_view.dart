import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_dark_widget.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_light_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/introduction_controller.dart';

part '../widgets/background_painter_dark.dart';
part '../widgets/background_painter_light.dart';

part '../widgets/button_arrow_widget.dart';
part '../widgets/center_circle_painter.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(controller.getSystemTheme(context)
                ? AssetPath.introductionBackgroundLight
                : AssetPath.introductionBackgroundDark),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: 10,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.5,
                  child: CustomPaint(
                    painter: (controller.getSystemTheme(context)
                        ? _BackgroundPainterLight()
                        : _BackgroundPainterDark()),
                  ),
                ),
              ),
            ),
            //------------------
            Positioned.fill(
              top: 20,
              child: Stack(
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.5,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    controller.getSystemTheme(context)
                                        ? AppColors.darkPrimary
                                        : AppColors.lightPurple,
                                    controller.getSystemTheme(context)
                                        ? AppColors.darkPrimary
                                        : AppColors.lightPurple,
                                    controller.getSystemTheme(context)
                                        ? AppColors.darkPrimaryVariant
                                        : AppColors.cyan,
                                    controller.getSystemTheme(context)
                                        ? AppColors.darkPrimaryVariant
                                        : AppColors.cyan,
                                  ],
                                  stops: const [
                                    0.1,
                                    0.3,
                                    0.8,
                                    1
                                  ])),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.5,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                AppColors.darkPrimary,
                                AppColors.darkPrimary,
                              ],
                              stops: [0.1, 0.5, 0.9, 1],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: screenHeight * 0.101,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.486,
                        child: const Image(
                          image: AssetImage(AssetPath.handCard),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //------------------
            Positioned.fill(
              top: 50,
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  controller.getSystemTheme(context)
                      ? AssetPath.lightLogo
                      : AssetPath.darkLogo,
                ),
              ),
            ),
            Positioned.fill(
              top: 300,
              child: Align(
                alignment: Alignment.center,
                child: controller.getSystemTheme(context)
                    ? GradientTextLightWidget(
                        stringData: 'The Digital wallet that\nconnects global',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 30 : 28,
                        boldValue: FontWeight.w800,
                        heightValue: 1.2,
                        centerAlignment: true,
                      )
                    : GradientTextDarkWidget(
                        stringData: 'The Digital wallet that\nconnects global',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 30 : 28,
                        boldValue: FontWeight.w800,
                        heightValue: 1.2,
                        centerAlignment: true,
                      ),
              ),
            ),
            Positioned.fill(
              top: screenWidth <= 428 && screenWidth > 390 ? 430 : 440,
              child: Align(
                alignment: Alignment.center,
                child: TextWidget(
                  overflow: false,
                  stringData:
                      'Banking Beyond, Welcome\nto the super experience',
                  fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 16,
                  boldValue: FontWeight.normal,
                  color: controller.getSystemTheme(context)
                      ? AppColors.lightTextPrimary
                      : AppColors.darkTextPrimary,
                  centerAlignment: true,
                ),
              ),
            ),
            Positioned.fill(
              bottom: 50,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _ButtonArrowWidget(
                  onPressed: () => {controller.goToLogin()},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
