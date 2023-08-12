part of '../views/login_view.dart';

class _PasswordFormOutlineWidget extends GetView<LoginController> {
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
        borderSide: const BorderSide(color: AppColors.darkPrimary, width: 0.3));
    return Obx(() => FormBuilderTextField(
          name: name,
          onChanged: onChanged,
          obscureText: controller.obscuredPassword,
          autofocus: false,
          style: const TextStyle(color: AppColors.darkPrimary),
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
                      color: AppColors.darkPrimary,
                    )
                  : const Icon(
                      LineIcons.eye,
                      color: AppColors.darkPrimary,
                    ),
            ),
            hintText: hintText.tr,
            hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.darkPrimary,
              ),
            ),
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
            filled: true,
            fillColor: AppColors.darkPrimary,
            errorStyle:
                const TextStyle(color: AppColors.darkPrimary, fontSize: 13),
          ),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
