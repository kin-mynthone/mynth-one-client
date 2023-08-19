part of '../views/dashboard_cards_view.dart';

class _HeaderWidget extends GetView<DashboardCardController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          stringData: 'Cards',
          fontSize: 20,
          boldValue: FontWeight.w500,
          color: controller.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
      ],
    );
  }
}
