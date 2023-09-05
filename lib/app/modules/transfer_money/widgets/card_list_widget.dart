import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/transfer_money_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/card_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/cards_controller.dart';

class CardListWidget extends GetView<CardsController> {
  const CardListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: controller.cardData.length.isEqual(0)
            ? _EmptyData(
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
              )
            : _FadingListViewWidget(
                dataLength: controller.cardData.length,
                cardData: controller.cardData.toList(),
              ),
      ),
    );
  }
}

class _FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Cards> cardData;
  const _FadingListViewWidget(
      {required this.dataLength, required this.cardData});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(214, 0, 0, 0),
            Colors.transparent,
            Colors.transparent,
            Color.fromARGB(214, 0, 0, 0),
          ],
          stops: [
            0.0,
            0.05,
            0.95,
            1.04
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView.separated(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 30.0, left: 20, right: 20),
        scrollDirection: Axis.vertical,
        itemCount: dataLength,
        itemBuilder: (context, index) {
          return CardWidget(
            cardModel: cardData[index],
            onTap: () {
              TransferMoneyController.instance.setAccountNameSenderValue(
                  cardData[index].accountName.toString());
              TransferMoneyController.instance.setAccountNumberSenderValue(
                  cardData[index].accountNumber.toString());
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
      ),
    );
  }
}

class _EmptyData extends StatelessWidget {
  final Color color;
  const _EmptyData({
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          overflow: false,
          stringData: 'No Cards to show',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
          overflow: false,
          stringData: 'You can add your first card here',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 11 : 10,
          boldValue: FontWeight.normal,
          color: color,
          centerAlignment: false,
        ),
      ],
    );
  }
}
