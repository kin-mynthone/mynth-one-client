part of '../views/card_info_view.dart';

class _HeaderWidget extends GetView<CardInfoController> {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GoBackButton(
          iconColor: CardInfoController.instance.getSystemTheme(context)
              ? AppColors.lightPrimary
              : AppColors.darkPrimary,
          onPressed: () {
            Get.back(closeOverlays: true);
          },
        ),
        TextWidget(
          stringData: controller.cardInfo.accountName.toString(),
          fontSize: 20,
          boldValue: FontWeight.w500,
          color: CardInfoController.instance.getSystemTheme(context)
              ? AppColors.lightTextPrimary
              : AppColors.darkTextPrimary, //TODO CHANGE COLOR,
          centerAlignment: false,
        ),
        IconButton(
          onPressed: () {},
          tooltip: 'edit info'.tr,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(
            LineIcons.edit,
            size: 30,
            color: CardInfoController.instance.getSystemTheme(context)
                ? AppColors.lightPrimary
                : AppColors.darkPrimary,
          ),
        )
      ],
    );
  }
}
