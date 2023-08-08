import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/modules/otp/controllers/otp_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_overlay_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

part '../widgets/header_widget.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppNumbers.screenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderWidget(),
                  SizedBox(height: 30),
                ],
              ),
            ),
            const Spacer(),
            Obx(() => controller.isLoading
                ? const LoadingOverlay()
                : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
