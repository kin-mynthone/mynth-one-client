import 'package:flutter/material.dart';
import 'package:mynth_one_client/app/constants/card_icon.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class DebitCardWidget extends StatelessWidget {
  final Data cardModel;

  const DebitCardWidget({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        height: 500,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.03,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(int.parse(cardModel.startColor.toString())),
                Color(int.parse(cardModel.endColor.toString())),
              ],
              stops: const [
                0.2,
                1
              ]),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    width: 40,
                    height: 40,
                    CardIcon.myIcons[int.parse(cardModel.icon.toString())]),
                TextWidget(
                  stringData: cardModel.accountNumber
                      .toString()
                      .replaceRange(0, 3, '***'),
                  fontSize: 15,
                  boldValue: FontWeight.normal,
                  letterSpacing: 8,
                  color: AppColors.darkPrimary,
                  centerAlignment: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextWidget(
                    stringData: '€',
                    fontSize: 25,
                    boldValue: FontWeight.w800,
                    letterSpacing: 8,
                    color: AppColors.darkPrimary,
                    centerAlignment: false,
                  ),
                ),
                TextWidget(
                  stringData: cardModel.amount.toString(),
                  fontSize: 35,
                  boldValue: FontWeight.w800,
                  color: AppColors.darkPrimary,
                  centerAlignment: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  stringData: cardModel.accountName.toString(),
                  fontSize: 15,
                  boldValue: FontWeight.w800,
                  color: AppColors.darkPrimary,
                  centerAlignment: false,
                ),
                TextWidget(
                  stringData: cardModel.expiration.toString(),
                  fontSize: 15,
                  boldValue: FontWeight.normal,
                  color: AppColors.darkPrimary,
                  centerAlignment: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
