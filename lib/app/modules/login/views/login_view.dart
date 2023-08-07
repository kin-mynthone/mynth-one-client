import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/loading_overlay_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/login_controller.dart';

part '../widgets/header_widget.dart';
part '../widgets/email_text_form_widget.dart';
part '../widgets/password_text_form_widget.dart';
part '../widgets/no_account_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(AppNumbers.screenPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _HeaderWidget(),
                  const SizedBox(height: 30),
                  _EmailFormOutlineWidget(
                    name: 'email',
                    iconPath: AssetPath.envelope,
                    onChanged: (value) => controller.setEmailValue(value!),
                    hintText: 'Enter your email',
                    onPress: () => {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _PasswordFormOutlineWidget(
                    name: 'password',
                    iconPath: AssetPath.lock,
                    onChanged: (value) => controller.setPasswordValue(value!),
                    hintText: 'Enter your password',
                    onPress: () => {},
                  ),
                  const SizedBox(height: 1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.goToForgotPassword();
                      },
                      child: Text(
                        'forgot password'.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.hF1F0FF,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PrimaryButtonWidget(
                    buttonText: 'Login',
                    height: 50,
                    fontSize: 18,
                    boldValue: true,
                    fontColor: AppColors.h403E51,
                    buttonColor: AppColors.hF4F4F4,
                    onTap: () => {controller.checkIfCredentialsAreValid()},
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _NoAccountWidget(onPressed: controller.goToRegistration)
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
