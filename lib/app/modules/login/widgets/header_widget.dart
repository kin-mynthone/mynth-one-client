part of '../views/login_view.dart';

class _HeaderWidget extends GetView<LoginController> {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          stringData: 'Sign In',
          fontSize: 20,
          boldValue: true,
          color: controller.checkSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        RichText(
          textDirection: TextDirection.rtl,
          maxLines: 1,
          textScaleFactor: 1,
          text: TextSpan(
            text: 'Hi, ',
            style: TextStyle(
                color: controller.checkSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
                fontSize: 28,
                fontWeight: FontWeight.w800),
            children: <TextSpan>[
              TextSpan(
                text: 'Good Day',
                style: TextStyle(
                    color: controller.checkSystemTheme(context)
                        ? AppColors.lightPrimary
                        : AppColors.darkPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        TextWidget(
          stringData: 'Please sign in to continue',
          fontSize: 15,
          boldValue: false,
          color: controller.checkSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
      ],
    );
  }
}
