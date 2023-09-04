import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/repositories/favorite_receiver_repository.dart';

import '../../../models/favorite_receiver_model.dart';

enum FavoriteReceiverStatus {
  initial,
  loading,
  succeeded,
  failed,
  error,
  invalid
}

class FavoriteReceiverController extends GetxController {
  static FavoriteReceiverController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = FavoriteReceiverStatus.initial.obs;

  FavoriteReceiverStatus get status => _status.value;

  final _favoriteReceiverData = <FavoriteReceiver>[].obs;

  bool get isLoading => _status.value == FavoriteReceiverStatus.loading;
  bool get hasSucceeded => _status.value == FavoriteReceiverStatus.succeeded;
  bool get hasFailed => _status.value == FavoriteReceiverStatus.failed;
  bool get isInvalid => _status.value == FavoriteReceiverStatus.invalid;

  List<FavoriteReceiver> get favoriteReceiverData => _favoriteReceiverData;

  String currentState() =>
      'FavoriteReceiverController(_status: ${_status.value}';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorFavoriteReceiverStatus();
    getFavoriteReceiver();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorFavoriteReceiverStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case FavoriteReceiverStatus.error:
            MyLogger.printError(currentState());
            break;
          case FavoriteReceiverStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case FavoriteReceiverStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case FavoriteReceiverStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case FavoriteReceiverStatus.failed:
            break;
          case FavoriteReceiverStatus.invalid:
            break;
        }
      },
    );
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  Future<void> getFavoriteReceiver() async {
    _status.value = FavoriteReceiverStatus.loading;
    try {
      _favoriteReceiverData.value =
          await FavoriteReceiverRepository.getAllFavoriteReceiver(
              accessToken: 'sample');
      _status.value = FavoriteReceiverStatus.succeeded;
    } catch (e) {
      MyLogger.printError(e);
      _status.value = FavoriteReceiverStatus.error;
    }
  }
}
