part of '../views/transfer_money_view.dart';

class _FavoriteWidget extends GetView<TransferMoneyController> {
  const _FavoriteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: AppNumbers.screenPadding, bottom: 10),
          child: TextWidget(
            overflow: false,
            stringData: 'Favorites',
            fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
            boldValue: FontWeight.w500,
            color: controller.getSystemTheme(context)
                ? AppColors.lightTextPrimary
                : AppColors.darkTextPrimary,
            centerAlignment: false,
          ),
        ),
        SizedBox(
            height: 140,
            width: screenWidth,
            child: const FavoriteReceiverListWidget()),
      ],
    );
  }
}
