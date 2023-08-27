
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scan_to_pay_controller.dart';
part '../widgets/header_widget.dart';
part '../widgets/qr_scanner_widget.dart';

class ScanToPayView extends GetView<ScanToPayStatus> {
  const ScanToPayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppNumbers.screenPadding,
              ),
              child: _HeaderWidget(),
            ),
            SizedBox(
              height: 500,
              child: _QrScannerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
