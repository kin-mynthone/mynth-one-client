part of '../views/dashboard_view.dart';

class _QrButtonWidget extends GetView<DashboardController> {
  const _QrButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.2,
      width: screenWidth * 0.2,
      child: FittedBox(
          child: FloatingActionButton(
        elevation: 5.5,
        backgroundColor: AppColors.darkPrimary,
        child: SizedBox(
          height: screenWidth * 0.07,
          width: screenWidth * 0.07,
          child: SvgPicture.asset(AssetPath.dQr,
              color: controller.getSystemTheme(context)
                  ? AppColors.lightSecondaryVariant
                  : AppColors.darkSecondaryVariant),
        ),
        onPressed: () {
          Get.toNamed(
            AppPages.QRSCANNER,
          );
        },
      )),
    );
  }
}
