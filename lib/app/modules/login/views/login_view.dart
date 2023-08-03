import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mynth_one_client/app/constants/app_strings.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/modules/login/controllers/login_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

part '../widgets/header_widget.dart';
part '../widgets/email_text_form_widget.dart';
part '../widgets/password_text_form_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        // child: ElevatedButton(
        //     onPressed: () => {checkAuthState()}, child: Text("Test AUth")),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                  ]),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
