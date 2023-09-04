import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/widgets/favorite_list_tile_widget.dart';
import '../controllers/favorite_receiver_controller.dart';
import '../controllers/transfer_money_controller.dart';

class FavoriteReceiverListWidget extends GetView<FavoriteReceiverController> {
  const FavoriteReceiverListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      scrollDirection: Axis.horizontal,
      itemCount: controller.favoriteReceiverData.length,
      itemBuilder: (context, index) {
        return FavoriteListTileWidget(
          favoriteReceiverModel: controller.favoriteReceiverData[index],
          onTap: () {
            TransferMoneyController.instance.setIsBankSelectedValue(false);
            TransferMoneyController.instance.setSelectedFavoriteValue(
                controller.favoriteReceiverData[index]);
            TransferMoneyController.instance.accountNameController.text =
                controller.favoriteReceiverData[index].receiver.toString();
            TransferMoneyController
                    .instance.accountNumberReceiverController.text =
                controller.favoriteReceiverData[index].accountNumber.toString();
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
