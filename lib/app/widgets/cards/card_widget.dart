import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynth_one_client/app/helpers/asset_path_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

class CardWidget extends StatelessWidget {
  final Data cardModel;
  final VoidCallback? onTap;

  const CardWidget({super.key, required this.cardModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 500,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.022,
          ),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(19, 0, 0, 0),
                blurRadius: 8.0,
                spreadRadius: 1,
              ),
            ],
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    stringData: cardModel.accountName.toString(),
                    fontSize: 15,
                    boldValue: FontWeight.w500,
                    color: AppColors.lightTextPrimary,
                    centerAlignment: false,
                  ),
                  SvgPicture.asset(AssetPath.cVisa),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        stringData: 'Your balance',
                        fontSize: 14,
                        boldValue: FontWeight.w300,
                        color: AppColors.lightTextPrimary,
                        centerAlignment: false,
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      TextWidget(
                        stringData: '€ ${cardModel.amount}',
                        fontSize: 30,
                        boldValue: FontWeight.w600,
                        color: AppColors.darkPrimary,
                        centerAlignment: false,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            stringData: 'A/c Number',
                            fontSize: 12,
                            boldValue: FontWeight.w300,
                            color: AppColors.lightTextPrimary,
                            centerAlignment: false,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            stringData: cardModel.accountNumber
                                .toString()
                                .replaceRange(0, 3, '****'),
                            fontSize: 13,
                            letterSpacing: 3,
                            boldValue: FontWeight.w400,
                            color: AppColors.lightTextPrimary,
                            centerAlignment: false,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            stringData: 'Valid Thu',
                            fontSize: 12,
                            boldValue: FontWeight.w300,
                            color: AppColors.lightTextPrimary,
                            centerAlignment: false,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            stringData: cardModel.expiration.toString(),
                            fontSize: 13,
                            letterSpacing: 3,
                            boldValue: FontWeight.w400,
                            color: AppColors.lightTextPrimary,
                            centerAlignment: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
