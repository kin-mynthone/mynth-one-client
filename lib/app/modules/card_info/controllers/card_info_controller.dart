import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';

enum CardInfoStatus { initial, loading, succeeded, failed, error, invalid }

class CardInfoController extends GetxController {
  static CardInfoController get instance => Get.find();

  final _cardInfo = Get.arguments as Data;
  late Worker _statusEverWorker;

  final _status = CardInfoStatus.initial.obs;

  CardInfoStatus get status => _status.value;

  bool get isLoading => _status.value == CardInfoStatus.loading;
  bool get hasSucceeded => _status.value == CardInfoStatus.succeeded;
  bool get hasFailed => _status.value == CardInfoStatus.failed;
  bool get isInvalid => _status.value == CardInfoStatus.invalid;

  Data get cardInfo => _cardInfo;

  final tooltipkey = GlobalKey<TooltipState>();

  String currentState() => 'CardInfoController(_status: ${_status.value},';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorCardInfoStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorCardInfoStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case CardInfoStatus.error:
            MyLogger.printError(currentState());
            break;
          case CardInfoStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CardInfoStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CardInfoStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case CardInfoStatus.failed:
            break;
          case CardInfoStatus.invalid:
            break;
        }
      },
    );
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
