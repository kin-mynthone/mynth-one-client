import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/registration_controller.dart';

part '../widgets/header_widget.dart';
part '../widgets/email_text_form_widget.dart';
part '../widgets/password_text_form_widget.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);

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
                  const SizedBox(
                    height: 50,
                  ),
                  PrimaryButtonWidget(
                    buttonText: 'Create Account',
                    height: 50,
                    fontSize: 18,
                    boldValue: true,
                    fontColor: AppColors.h403E51,
                    buttonColor: AppColors.hF4F4F4,
                    onTap: () => {controller.checkIfCredentialsAreValid()},
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
