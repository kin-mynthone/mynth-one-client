import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/card_model.dart';
import 'package:mynth_one_client/app/repositories/card_repository.dart';
import 'package:mynth_one_client/app/routes/app_pages.dart';

enum DashboardCardStatus { initial, loading, succeeded, failed, error, invalid }

class DashboardCardsController extends GetxController {
  static DashboardCardsController get instance => Get.find();
  late Worker _statusEverWorker;

  final _status = DashboardCardStatus.initial.obs;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _stringSample = ''.obs;

  DashboardCardStatus get status => _status.value;
  GlobalKey<FormBuilderState> get formKey => _formKey;
  String get stringSample => _stringSample.value;

  final _cardData = <Data>[].obs;

  bool get isLoading => _status.value == DashboardCardStatus.loading;
  bool get hasSucceeded => _status.value == DashboardCardStatus.succeeded;
  bool get hasFailed => _status.value == DashboardCardStatus.failed;
  bool get isInvalid => _status.value == DashboardCardStatus.invalid;

  List<Data> get cardData => _cardData;

  String currentState() =>
      'DashboardCardsController(_status: ${_status.value},  _stringSample: ${_stringSample.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorDashboardCardStatus();
    getCard();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorDashboardCardStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case DashboardCardStatus.error:
            MyLogger.printError(currentState());
            break;
          case DashboardCardStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case DashboardCardStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case DashboardCardStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case DashboardCardStatus.failed:
            break;
          case DashboardCardStatus.invalid:
            break;
        }
      },
    );
  }

  void setstringSampleValue(String stringSample) {
    _stringSample.value = stringSample.trim();
    MyLogger.printInfo(currentState());
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }

  Future<void> getCard() async {
    _status.value = DashboardCardStatus.loading;
    try {
      _cardData.value = await CardRepository.getCards(accessToken: 'sample');
      _status.value = DashboardCardStatus.succeeded;
    } catch (e) {
      MyLogger.printError(e);

      _status.value = DashboardCardStatus.error;
    }
  }

  goToCardInfo(Data data) {
    Get.toNamed(
      AppPages.CARDINFO,
      arguments: data,
    );
  }
}
