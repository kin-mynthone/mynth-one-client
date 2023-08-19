part of '../views/dashboard_view.dart';

class _QrButtonWidget extends GetView<DashboardController> {
  const _QrButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: FittedBox(
          child: FloatingActionButton(
        elevation: 5.5,
        backgroundColor: AppColors.darkPrimary,
        child: SizedBox(
          height: 25,
          width: 25,
          child: SvgPicture.asset(AssetPath.dQr,
              color: controller.getSystemTheme(context)
                  ? AppColors.lightSecondaryVariant
                  : AppColors.darkSecondaryVariant),
        ),
        onPressed: () {},
      )),
    );
  }
}
