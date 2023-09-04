import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/button_icon_widget.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/personal_qr_code_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/bottom_options_widget.dart';

class PersonalQrCodeView extends GetView<PersonalQrCodeController> {
  const PersonalQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppNumbers.screenPadding,
                  vertical: AppNumbers.screenPadding),
              child: _HeaderWidget(),
            ),
            Obx(
              () => Screenshot(
                controller: controller.screenshotController,
                child: Column(
                  children: [
                    QrImageView(
                      embeddedImage: AssetImage(
                          controller.getSystemTheme(context)
                              ? AssetPath.logoLightPrimary
                              : AssetPath.logoDarkPrimary),
                      eyeStyle: QrEyeStyle(
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightPrimary
                              : AppColors.darkPrimary,
                          eyeShape: QrEyeShape.square),
                      dataModuleStyle: QrDataModuleStyle(
                          color: controller.getSystemTheme(context)
                              ? AppColors.lightTextPrimary
                              : AppColors.darkTextPrimary,
                          dataModuleShape: QrDataModuleShape.square),
                      data: controller.qrData,
                      version: QrVersions.auto,
                      size: 250,
                      gapless: false,
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(60, 60),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextWidget(
                        stringData: 'Kindred Inocencio',
                        fontSize:
                            screenWidth <= 428 && screenWidth > 390 ? 23 : 20,
                        boldValue: FontWeight.w700,
                        color: controller.getSystemTheme(context)
                            ? AppColors.lightTextPrimary
                            : AppColors.darkTextPrimary,
                        centerAlignment: false),
                  ],
                ),
              ),
            ),
            const Spacer(),
            const _BottomOptionsWidget(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
