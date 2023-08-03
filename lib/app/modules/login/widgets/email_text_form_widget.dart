part of '../views/login_view.dart';

class _EmailFormOutlineWidget extends StatelessWidget {
  final String iconPath;
  final String hintText;
  final String name;

  final Function onPress;
  final void Function(String?)? onChanged;

  const _EmailFormOutlineWidget({
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
    return FormBuilderTextField(
      name: name,
      onChanged: onChanged,
      autofocus: true,
      style: const TextStyle(color: AppColors.hF1F0FF),
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
    );
  }
}
