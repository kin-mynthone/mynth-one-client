import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/models/banks_model.dart';
import 'package:mynth_one_client/app/modules/transfer_money/controllers/transfer_money_controller.dart';
import 'package:mynth_one_client/app/themes/app_colors.dart';
import 'package:mynth_one_client/app/widgets/banks_list_tile_widget.dart';
import 'package:mynth_one_client/app/widgets/text_widget.dart';

import '../controllers/banks_controller.dart';

class BankListWidget extends GetView<BanksController> {
  const BankListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: controller.banksData.length.isEqual(0)
            ? _EmptyData(
                color: controller.getSystemTheme(context)
                    ? AppColors.lightTextPrimary
                    : AppColors.darkTextPrimary,
              )
            : _FadingListViewWidget(
                dataLength: controller.banksData.length,
                banksData: controller.banksData.toList(),
              ),
      ),
    );
  }
}

class _FadingListViewWidget extends StatelessWidget {
  final int dataLength;
  final List<Banks> banksData;
  const _FadingListViewWidget(
      {required this.dataLength, required this.banksData});
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
        padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
        scrollDirection: Axis.vertical,
        itemCount: dataLength,
        itemBuilder: (context, index) {
          return BanksListTileWidget(
            banksModel: banksData[index],
            onTap: () {
              TransferMoneyController.instance.setIsBankSelectedValue(true);
              TransferMoneyController.instance
                  .setSelectedBankValue(banksData[index]);
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
          stringData: 'No Cards to show',
          fontSize: screenWidth <= 428 && screenWidth > 390 ? 15 : 12,
          boldValue: FontWeight.w800,
          color: color,
          centerAlignment: false,
        ),
        TextWidget(
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
