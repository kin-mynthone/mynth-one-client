import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/repositories/banks_repository.dart';

import '../../../models/banks_model.dart';

enum BanksStatus { initial, loading, succeeded, failed, error, invalid }

class BanksController extends GetxController {
  static BanksController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = BanksStatus.initial.obs;

  BanksStatus get status => _status.value;

  final _banksData = <Banks>[].obs;

  bool get isLoading => _status.value == BanksStatus.loading;
  bool get hasSucceeded => _status.value == BanksStatus.succeeded;
  bool get hasFailed => _status.value == BanksStatus.failed;
  bool get isInvalid => _status.value == BanksStatus.invalid;

  List<Banks> get banksData => _banksData;

  String currentState() => 'BanksController(_status: ${_status.value}';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorBanksStatus();
    getBanks();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorBanksStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case BanksStatus.error:
            MyLogger.printError(currentState());
            break;
          case BanksStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case BanksStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case BanksStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case BanksStatus.failed:
            break;
          case BanksStatus.invalid:
            break;
        }
      },
    );
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  Future<void> getBanks() async {
    _status.value = BanksStatus.loading;
    try {
      _banksData.value =
          await BanksRepository.getAllBanks(accessToken: 'sample');
      _status.value = BanksStatus.succeeded;
    } catch (e) {
      MyLogger.printError(e);
      _status.value = BanksStatus.error;
    }
  }
}
