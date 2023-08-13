part of '../views/login_view.dart';

class _EmailTextFormWidget extends StatelessWidget {
  final String hintText;
  final String name;

  final void Function(String?)? onChanged;

  const _EmailTextFormWidget({
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
        FormBuilderTextField(
          name: name,
          onChanged: onChanged,
          autofocus: false,
          style: TextStyle(
            color: LoginController.instance.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
          ),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'email is required'.tr;
            } else if (value.isNotEmpty) {
              final isEmailValid =
                  RegExp(AppStrings.emailRegExp).hasMatch(value);
              return isEmailValid ? null : 'invalid email format'.tr;
            }
            return null;
          },
          autocorrect: false,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: LoginController.instance.getSystemTheme(context)
                    ? AppColors.lightTextHint
                    : AppColors.darkTextHint,
              ),
            ),
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
            filled: true,
            fillColor: LoginController.instance.getSystemTheme(context)
                ? AppColors.lightBackground
                : AppColors.darkBackground,
            errorStyle: const TextStyle(color: AppColors.red, fontSize: 13),
          ),
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
