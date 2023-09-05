import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/repositories/card_repository.dart';

enum CardsStatus { initial, loading, succeeded, failed, error, invalid }

class CardsController extends GetxController {
  static CardsController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = CardsStatus.initial.obs;

  CardsStatus get status => _status.value;

  final _cardData = <Cards>[].obs;

  bool get isLoading => _status.value == CardsStatus.loading;
  bool get hasSucceeded => _status.value == CardsStatus.succeeded;
  bool get hasFailed => _status.value == CardsStatus.failed;
  bool get isInvalid => _status.value == CardsStatus.invalid;

  List<Cards> get cardData => _cardData;

  String currentState() => 'CardsController(_status: ${_status.value}';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorCardsStatus();
    getCards();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorCardsStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case CardsStatus.error:
            MyLogger.printError(currentState());
            break;
          case CardsStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CardsStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CardsStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case CardsStatus.failed:
            break;
          case CardsStatus.invalid:
            break;
        }
      },
    );
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  Future<void> getCards() async {
    _status.value = CardsStatus.loading;
    try {
      _cardData.value = await CardRepository.getCards(accessToken: 'sample');
      _status.value = CardsStatus.succeeded;
    } catch (e) {
      MyLogger.printError(e);

      _status.value = CardsStatus.error;
    }
  }
}
