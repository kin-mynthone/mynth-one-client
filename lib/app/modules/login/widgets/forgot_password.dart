part of '../views/login_view.dart';

class _ForgotPassword extends StatelessWidget {
  final Function onPressed;

  const _ForgotPassword({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return TextButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed();
      },
      child: Text(
        'forgot password'.tr,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w200,
              color: LoginController.instance.getSystemTheme(context)
                  ? AppColors.lightTextPrimary
                  : AppColors.darkTextPrimary,
              fontSize: screenWidth <= 428 && screenWidth > 390 ? 13 : 11,
            ),
      ),
    );
  }
}
