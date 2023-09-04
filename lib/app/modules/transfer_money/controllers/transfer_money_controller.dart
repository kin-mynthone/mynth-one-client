import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/favorite_receiver_model.dart';

import '../../../models/banks_model.dart';

enum TransferMoneyStatus { initial, loading, succeeded, failed, error, invalid }

class TransferMoneyController extends GetxController {
  static TransferMoneyController get instance => Get.find();
  late Worker _statusEverWorker;

  final GlobalKey<FormBuilderState> _formKey1 = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get formKey1 => _formKey1;
  final GlobalKey<FormBuilderState> _formKey2 = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get formKey2 => _formKey2;

  final _currentIndex = 0.obs;
  final _isBankSelected = false.obs;

  final _selectedBank = Banks().obs;
  final _selectedFavorite = FavoriteReceiver().obs;

  final _accountNameController = TextEditingController();
  final _accountNumberReceiverController = TextEditingController();
  final _amountController = TextEditingController();
  final _receiverEmailController = TextEditingController();

  final _accountNumberSender = '123123'.obs;
  final _accountNameSender = 'kindred'.obs;
  final _transferFee = 1.obs;

  final _status = TransferMoneyStatus.initial.obs;
  TransferMoneyStatus get status => _status.value;

  int get currentIndex => _currentIndex.value;

  TextEditingController get accountNameController => _accountNameController;
  TextEditingController get accountNumberReceiverController =>
      _accountNumberReceiverController;
  TextEditingController get amountController => _amountController;
  TextEditingController get receiverEmailController => _receiverEmailController;

  String get accountNumberSender => _accountNumberSender.value;
  String get accountNameSender => _accountNameSender.value;
  int get transferFee => _transferFee.value;
  bool get isBankSelected => _isBankSelected.value;

  Banks get selectedBank => _selectedBank.value;
  FavoriteReceiver get selectedFavorite => _selectedFavorite.value;

  bool get isLoading => _status.value == TransferMoneyStatus.loading;
  bool get hasSucceeded => _status.value == TransferMoneyStatus.succeeded;
  bool get hasFailed => _status.value == TransferMoneyStatus.failed;
  bool get isInvalid => _status.value == TransferMoneyStatus.invalid;

  String currentState() => 'TransferMoneyController(_status: ${_status.value},';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    _monitorTransferMoneyStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorTransferMoneyStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case TransferMoneyStatus.error:
            MyLogger.printError(currentState());
            break;
          case TransferMoneyStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case TransferMoneyStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case TransferMoneyStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case TransferMoneyStatus.failed:
            break;
          case TransferMoneyStatus.invalid:
            break;
        }
      },
    );
  }

  void setCurrentIndexValue(int index) => _currentIndex.value = index;

  void setAccountNumberSenderValue(String value) =>
      _accountNumberSender.value = value;

  void setAccountNameSenderValue(String value) =>
      _accountNameSender.value = value;

  void setSelectedBankValue(Banks value) {
    _selectedBank.value = value;
    _currentIndex.value = 1;
  }

  void setIsBankSelectedValue(bool value) {
    _isBankSelected.value = value;
  }

  void clearData() {
    _accountNameSender.value = '';
    _accountNumberSender.value = '';
    accountNameController.clear();
    accountNumberReceiverController.clear();
    amountController.clear();
    receiverEmailController.clear();
  }

  void setSelectedFavoriteValue(FavoriteReceiver value) {
    _selectedFavorite.value = value;
    _currentIndex.value = 1;
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
