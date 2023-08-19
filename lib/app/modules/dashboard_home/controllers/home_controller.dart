import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/repositories/card_repository.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum HomeStatus { initial, loading, succeeded, failed, error }

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = HomeStatus.initial.obs;

  final _cardData = <Data>[].obs;
  static RxBool isVerifying = false.obs;

  HomeStatus get status => _status.value;

  bool get isLoading => _status.value == HomeStatus.loading;
  bool get hasSucceeded => _status.value == HomeStatus.succeeded;
  bool get hasFailed => _status.value == HomeStatus.failed;

  List<Data> get cardData => _cardData;

  String currentState() => 'HomeController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getCard();

    _monitorHomeStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorHomeStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case HomeStatus.error:
            MyLogger.printError(currentState());
            break;
          case HomeStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case HomeStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case HomeStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case HomeStatus.failed:
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
    // _status.value = HomeStatus.loading;
    try {
      _cardData.value = await CardRepository.getCards(accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = HomeStatus.error;
    }
  }

  goToCardInfo(Data data) {
    Get.toNamed(
      AppPages.CARDINFO,
      arguments: data,
    );
  }
}
