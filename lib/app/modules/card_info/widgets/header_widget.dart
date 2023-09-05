part of '../views/card_info_view.dart';

class _HeaderWidget extends GetView<CardInfoController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GoBackButton(
          iconColor: controller.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          onPressed: () {
            Get.back(closeOverlays: true);
          },
        ),
        TextWidget(
          overflow: false,
          stringData: controller.cardInfo.accountName.toString(),
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 20 : 17,
          boldValue: FontWeight.w500,
          color: controller.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary,
          centerAlignment: false,
        ),
        IconButton(
          onPressed: () {},
          tooltip: 'edit info'.tr,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            LineIcons.edit,
            size: 27,
            color: controller.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
          ),
        )
      ],
    );
  }
}
