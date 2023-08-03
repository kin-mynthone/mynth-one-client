import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/introduction/controllers/introduction_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/gradient_text_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

part '../widgets/background_painter.dart';
part '../widgets/button_arrow_widget.dart';
part '../widgets/center_circle_painter.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.introductionBackground),
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
                  width: size.width * 0.95,
                  height: size.height * 0.5,
                  child: CustomPaint(
                    painter: _BackgroundPainter(),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.42,
                  height: size.height * 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.hD9D3F9,
                              AppColors.hD9D3F9,
                              AppColors.hE4F9F6,
                              AppColors.hE4F9F6
                            ],
                            stops: [
                              0.1,
                              0.3,
                              0.8,
                              1
                            ])),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width * 0.42,
                  height: size.height * 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              AppColors.hD9D3F9,
                              AppColors.hD9D3F9,
                            ],
                            stops: [
                              0.1,
                              0.5,
                              0.9,
                              1
                            ])),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 96,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: size.width * 0.42,
                  height: size.height * 0.5,
                  child: const Image(
                    image: AssetImage(AssetPath.handCard),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 50,
              child: Align(
                alignment: Alignment.topCenter,
                child: TextWidget(
                  stringData: AppStrings.title,
                  fontSize: 25,
                  boldValue: true,
                  color: AppColors.h4A495E,
                  centerAlignment: true,
                ),
              ),
            ),
            const Positioned.fill(
              top: 300,
              child: Align(
                alignment: Alignment.center,
                child: GradientTextWidget(
                  stringData: 'Hassle free\npayment method',
                  fontSize: 35,
                  boldValue: true,
                  heightValue: 1.2,
                  centerAlignment: true,
                ),
              ),
            ),
            Positioned.fill(
              top: 450,
              child: Align(
                alignment: Alignment.center,
                child: TextWidget(
                  stringData:
                      'Connect your money to your friends\nfamily and Brands',
                  fontSize: 15,
                  boldValue: false,
                  color: AppColors.hF1F0FF,
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
