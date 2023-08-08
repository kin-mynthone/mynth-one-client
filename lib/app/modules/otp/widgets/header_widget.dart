part of '../views/otp_view.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          stringData: 'Sign in your acount',
          fontSize: 25,
          boldValue: true,
          color: AppColors.hF1F0FF,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Hello, Welcome back to MynthOne',
          fontSize: 14,
          boldValue: false,
          color: AppColors.hF1F0FF,
          centerAlignment: false,
        ),
      ],
    );
  }
}
