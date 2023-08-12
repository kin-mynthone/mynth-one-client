part of '../views/registration_view.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GoBackButton(
          iconColor: Colors.white,
          onPressed: () {
            FocusScope.of(context).unfocus();
            Get.back(closeOverlays: true);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextWidget(
          stringData: 'Create a new Account',
          fontSize: 25,
          boldValue: true,
          color: AppColors.darkPrimary,
          centerAlignment: false,
        ),
        TextWidget(
          stringData: 'Hello, be part of MynthOne',
          fontSize: 14,
          boldValue: false,
          color: AppColors.darkPrimary,
          centerAlignment: false,
        ),
      ],
    );
  }
}
