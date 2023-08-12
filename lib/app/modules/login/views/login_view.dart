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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        padding: const EdgeInsets.only(
          top: 40,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(controller.checkSystemTheme(context)
                ? AssetPath.introductionBackgroundLight
                : AssetPath.introductionBackgroundDark),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppNumbers.screenPadding, vertical: 10),
              child: SizedBox(
                width: 170,
                child: SvgPicture.asset(
                  controller.checkSystemTheme(context)
                      ? AssetPath.lightLogo1
                      : AssetPath.darkLogo1,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(
                  30,
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: controller.checkSystemTheme(context)
                        ? Colors.white
                        : AppColors.darkbackgroundvariant),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HeaderWidget(),
                    const SizedBox(
                      height: 40,
                    ),
                    _EmailFormOutlineWidget(
                      name: 'email',
                      hintText: 'enter your email',
                      onChanged: (value) => controller.setEmailValue(value!),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
