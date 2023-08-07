part of '../views/registration_view.dart';

class _PasswordFormOutlineWidget extends GetView<RegistrationController> {
  final String iconPath;
  final String hintText;
  final String name;

  final Function onPress;
  final void Function(String?)? onChanged;

  const _PasswordFormOutlineWidget({
    required this.name,
    required this.iconPath,
    required this.hintText,
    required this.onPress,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.hF1F0FF, width: 0.3));
    return Obx(() => FormBuilderTextField(
          name: name,
          onChanged: onChanged,
          obscureText: controller.obscuredPassword,
          autofocus: false,
          style: const TextStyle(color: AppColors.hF1F0FF),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'password is required'.tr;
            } else if (value.isNotEmpty) {
              // should contain at least one upper case
              // should contain at least one lower case
              // should contain at least one digit
              // should contain at least one Special character
              // Must be at least 8 characters in length

              final isPasswordValid =
                  RegExp(AppStrings.passwordRegExp).hasMatch(value);

              return isPasswordValid
                  ? null
                  : "Invalid Passowrd. should contain\n* at least one upper case\n* at least one lower case\n* at least one digit\n* at least one Special character\n* must be at least 8 characters in length"
                      .tr;
            }
            return null;
          },
          autocorrect: false,
          decoration: InputDecoration(
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 18,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            suffixIcon: IconButton(
              onPressed: () => controller.toggleObscuredPasswordValue(),
              icon: controller.obscuredPassword
                  ? const Icon(
                      LineIcons.eyeSlash,
                      color: AppColors.hF1F0FF,
                    )
                  : const Icon(
                      LineIcons.eye,
                      color: AppColors.hFBB810,
                    ),
            ),
            hintText: hintText.tr,
            hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.hBDBDBD,
              ),
            ),
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
            filled: true,
            fillColor: AppColors.h4A495E,
            errorStyle: const TextStyle(color: AppColors.hFBB810, fontSize: 13),
          ),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
