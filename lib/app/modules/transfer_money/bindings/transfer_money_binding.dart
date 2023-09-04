import 'package:get/get.dart';

import '../controllers/banks_controller.dart';
import '../controllers/favorite_receiver_controller.dart';
import '../controllers/transfer_money_controller.dart';

class TransferMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransferMoneyController());
    Get.put(FavoriteReceiverController());
    Get.put(BanksController());
  }
}
