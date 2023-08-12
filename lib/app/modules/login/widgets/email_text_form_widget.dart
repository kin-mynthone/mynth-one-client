part of '../views/login_view.dart';

class _EmailFormOutlineWidget extends StatelessWidget {
  final String hintText;
  final String name;

  final void Function(String?)? onChanged;

  const _EmailFormOutlineWidget({
    required this.name,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColors.darkPrimary, width: 0.3));
    return FormBuilderTextField(
      name: name,
      onChanged: onChanged,
      autofocus: false,
      style: const TextStyle(color: AppColors.darkPrimary),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'email is required'.tr;
        } else if (value.isNotEmpty) {
          final isEmailValid = RegExp(AppStrings.emailRegExp).hasMatch(value);
          return isEmailValid ? null : 'invalid email format'.tr;
        }
        return null;
      },
      autocorrect: false,
      decoration: InputDecoration(
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
        fillColor: LoginController.instance.checkSystemTheme(context)
            ? AppColors.lightbackground
            : AppColors.darkbackground,
        errorStyle: const TextStyle(color: AppColors.darkPrimary, fontSize: 13),
      ),
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
