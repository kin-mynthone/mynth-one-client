import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynth_one_client/app/constants/app_numbers.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/registration/controllers/registration_page_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/go_back_button_widget.dart';
import 'package:mynth_one_client/app/widgets/primary_button_widget.dart';
import 'package:mynth_one_client/app/widgets/text_form_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';
import '../controllers/registration_controller.dart';

part '../widgets/header_widget.dart';
part '../widgets/email_text_form_widget.dart';
part '../widgets/password_text_form_widget.dart';
part '../widgets/page_indicator_widget.dart';
part '../widgets/phone_number_text_form_widget.dart';

class RegistrationView extends GetView<RegistrationPageController> {
  const RegistrationView({Key? key}) : super(key: key);

  static const _views = <Widget>[
    _FirstPart(),
    _SecondPart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
    );
  }

  Obx _buildBody() {
    return Obx(() => SafeArea(
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
                    const SizedBox(
                      height: 30,
                    ),
                    const _PageIndicatorWidget(),
                    const SizedBox(
                      height: 40,
                    ),
                    _views[controller.currentIndex]
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _FirstPart extends GetView<RegistrationController> {
  const _FirstPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormWidget(
          name: 'given name'.tr,
          hintText: 'enter your given name',
          isRequired: true,
          borderColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          nameColor: controller.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          textColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          hintColor: controller.getSystemTheme(context)
              ? AppColors.lightTextHint
              : AppColors.darkTextHint,
          fillColor: controller.getSystemTheme(context)
              ? AppColors.lightBackground
              : AppColors.darkBackground,
          keyboardType: TextInputType.text,
          onChanged: (value) => controller.setGivenNameValue(value!),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormWidget(
          name: 'surname'.tr,
          hintText: 'enter your surname',
          isRequired: true,
          borderColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          nameColor: controller.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          textColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          hintColor: controller.getSystemTheme(context)
              ? AppColors.lightTextHint
              : AppColors.darkTextHint,
          fillColor: controller.getSystemTheme(context)
              ? AppColors.lightBackground
              : AppColors.darkBackground,
          keyboardType: TextInputType.text,
          onChanged: (value) => controller.setSurnameValue(value!),
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryButtonWidget(
          buttonText: 'Next',
          height: 50,
          fontSize: 15,
          boldValue: FontWeight.w800,
          fontColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary
              : AppColors.darkSecondary,
          buttonColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          splashColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary.withOpacity(0.30)
              : AppColors.darkSecondary.withOpacity(0.30),
          highlightColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary.withOpacity(0.15)
              : AppColors.darkSecondary.withOpacity(0.15),
          onTap: () =>
              {RegistrationPageController.instance.setCurrentIndexValue(1)},
        ),
      ],
    );
  }
}

class _SecondPart extends GetView<RegistrationController> {
  const _SecondPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _EmailTextFormWidget(
          name: 'Email',
          hintText: 'enter your email',
          onChanged: (value) => controller.setEmailValue(value!),
        ),
        const SizedBox(
          height: 30,
        ),
        _PhoneNumberTextFormWidget(
          name: 'phone number'.tr,
          hintText: 'enter your phone number',
          onChanged: (value) => controller.setPasswordValue(value!),
        ),
        const SizedBox(
          height: 30,
        ),
        _PasswordTextFormWidget(
          name: 'Password',
          hintText: 'enter your password',
          onChanged: (value) => controller.setPasswordValue(value!),
        ),
        const SizedBox(
          height: 50,
        ),
        PrimaryButtonWidget(
          buttonText: 'FINISH',
          height: 50,
          fontSize: 15,
          boldValue: FontWeight.w800,
          fontColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary
              : AppColors.darkSecondary,
          buttonColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          splashColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary.withOpacity(0.30)
              : AppColors.darkSecondary.withOpacity(0.30),
          highlightColor: controller.getSystemTheme(context)
              ? AppColors.lightSecondary.withOpacity(0.15)
              : AppColors.darkSecondary.withOpacity(0.15),
          onTap: () => {controller.checkIfCredentialsAreValid()},
        ),
      ],
    );
  }
}
