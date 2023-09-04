import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/repositories/card_repository.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum DashboardHomeStatus { initial, loading, succeeded, failed, error }

class DashboardHomeController extends GetxController {
  static DashboardHomeController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = DashboardHomeStatus.initial.obs;

  final _cardData = <Data>[].obs;

  DashboardHomeStatus get status => _status.value;

  bool get isLoading => _status.value == DashboardHomeStatus.loading;
  bool get hasSucceeded => _status.value == DashboardHomeStatus.succeeded;
  bool get hasFailed => _status.value == DashboardHomeStatus.failed;

  List<Data> get cardData => _cardData;

  String currentState() =>
      'DashboardHomeController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getCard();

    _monitorDashboardHomeStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorDashboardHomeStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case DashboardHomeStatus.error:
            MyLogger.printError(currentState());
            break;
          case DashboardHomeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case DashboardHomeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case DashboardHomeStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case DashboardHomeStatus.failed:
            break;
        }
      },
    );
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  Future<void> getCard() async {
    // _status.value = DashboardHomeStatus.loading;
    try {
      _cardData.value = await CardRepository.getCards(accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = DashboardHomeStatus.error;
    }
  }

  void goToCardInfo(Data data) {
    Get.toNamed(
      AppPages.CARD_INFO,
      arguments: data,
    );
  }

  void gotoTransferMoney() {
    Get.toNamed(
      AppPages.TRANSFER_MONEY,
    );
  }
}
