import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/otp/controllers/otp_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_overlay_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

part '../widgets/header_widget.dart';
part '../widgets/otp_text_field_widget.dart';
part '../widgets/resend_widget.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.getSystemTheme(context)
          ? AppColors.lightBackgroundVariant
          : AppColors.darkBackgroundVariant,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppNumbers.screenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _HeaderWidget(),
                  SizedBox(height: 30),
                  _OtpTextFieldWidget(),
                  SizedBox(height: 30),
                  _ResendWidget(),
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
