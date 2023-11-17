import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'dart:math';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/button_icon_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/scan_to_pay_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/qr_scanner_widget.dart';
part '../widgets/overlay_widget.dart';
part '../widgets/bottom_options_widget.dart';

class ScanToPayView extends GetView<ScanToPayController> {
  const ScanToPayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(child: _QrScannerWidget()),
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: _OverlayShape(
                  borderColor: controller.getSystemTheme(context)
                      ? AppColors.lightPrimary
                      : AppColors.darkPrimary,
                  borderRadius: 40,
                  borderLength: 40,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 400),
                  child: TextWidget(
                      overflow: false,
                      stringData: 'Point the camera at the qr code',
                      fontSize:
                          screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
                      boldValue: FontWeight.w300,
                      color: controller.getSystemTheme(context)
                          ? AppColors.lightSecondaryVariant
                          : AppColors.darkSecondaryVariant,
                      centerAlignment: false),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 10,
            child: _HeaderWidget(),
          ),
          const Positioned(
            bottom: 50,
            child: _BottomOptionsWidget(),
          ),
        ],
      ),
    );
  }
}
