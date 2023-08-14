part of '../views/login_view.dart';

class _PasswordTextFormWidget extends GetView<LoginController> {
  final String hintText;
  final String name;

  final void Function(String?)? onChanged;

  const _PasswordTextFormWidget({
    required this.name,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: LoginController.instance.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          width: 0.3),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          stringData: name,
          fontSize: 15,
          boldValue: FontWeight.normal,
          color: LoginController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() => FormBuilderTextField(
              name: name,
              onChanged: onChanged,
              obscureText: controller.obscuredPassword,
              autofocus: false,
              style: GoogleFonts.poppins(
                color: LoginController.instance.getSystemTheme(context)
                    ? AppColors.lightPrimary
                    : AppColors.darkPrimary,
              ),
              autocorrect: false,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => controller.toggleObscuredPasswordValue(),
                  icon: controller.obscuredPassword
                      ? Icon(
                          LineIcons.eyeSlash,
                          color:
                              LoginController.instance.getSystemTheme(context)
                                  ? AppColors.lightPrimary
                                  : AppColors.darkPrimary,
                        )
                      : Icon(
                          LineIcons.eye,
                          color:
                              LoginController.instance.getSystemTheme(context)
                                  ? AppColors.lightPrimary
                                  : AppColors.darkPrimary,
                        ),
                ),
                hintText: hintText.tr,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: LoginController.instance.getSystemTheme(context)
                      ? AppColors.lightTextHint
                      : AppColors.darkTextHint,
                ),
                focusedBorder: defaultBorder,
                enabledBorder: defaultBorder,
                errorBorder: defaultBorder,
                focusedErrorBorder: defaultBorder,
                filled: true,
                fillColor: LoginController.instance.getSystemTheme(context)
                    ? AppColors.lightBackground
                    : AppColors.darkBackground,
                errorStyle:
                    GoogleFonts.poppins(color: AppColors.red, fontSize: 13),
              ),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
            )),
      ],
    );
  }
}
