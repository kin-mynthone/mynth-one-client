part of '../views/registration_view.dart';

class _PhoneNumberTextFormWidget extends StatelessWidget {
  final String hintText;
  final String name;

  final void Function(String?)? onChanged;

  const _PhoneNumberTextFormWidget({
    required this.name,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppNumbers.inputBorderRadius),
      borderSide: BorderSide(
          color: RegistrationController.instance.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          width: 0.3),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          overflow: false,
          stringData: name,
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
          boldValue: FontWeight.normal,
          color: RegistrationController.instance.getSystemTheme(context)
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
          style: GoogleFonts.poppins(
            color: RegistrationController.instance.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkTextPrimary,
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
          ),
          validator: (String? value) {
            if (value == null || value.trim().isEmpty) {
              return 'phone number is required'.tr;
            }
            return null;
          },
          autocorrect: false,
          decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: GoogleFonts.poppins(
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 18,
              fontWeight: FontWeight.w400,
              color: RegistrationController.instance.getSystemTheme(context)
                  ? AppColors.lightTextHint
                  : AppColors.darkTextHint,
            ),
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
            errorBorder: defaultBorder,
            focusedErrorBorder: defaultBorder,
            filled: true,
            fillColor: RegistrationController.instance.getSystemTheme(context)
                ? AppColors.lightBackground
                : AppColors.darkBackground,
            errorStyle: GoogleFonts.poppins(
              color: AppColors.red,
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 13 : 16,
            ),
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
