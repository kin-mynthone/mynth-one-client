import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/repositories/activities_repository.dart';
import 'package:intl/intl.dart';

enum ActivitiesStatus { initial, loading, succeeded, failed, error }

class ActivitiesController extends GetxController {
  static ActivitiesController get instance => Get.find();

  late Worker _statusEverWorker;

  final _status = ActivitiesStatus.initial.obs;

  final _activitiesData = <Data>[].obs;
  static RxBool isVerifying = false.obs;

  ActivitiesStatus get status => _status.value;

  bool get isLoading => _status.value == ActivitiesStatus.loading;
  bool get hasSucceeded => _status.value == ActivitiesStatus.succeeded;
  bool get hasFailed => _status.value == ActivitiesStatus.failed;

  List<Data> get activitiesData => _activitiesData;

  String currentState() => 'ActivitiesController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getActivities();

    _monitorActivitiesStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorActivitiesStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case ActivitiesStatus.error:
            MyLogger.printError(currentState());
            break;
          case ActivitiesStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case ActivitiesStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case ActivitiesStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case ActivitiesStatus.failed:
            break;
        }
      },
    );
  }

  Future<void> getActivities() async {
    // _status.value = ActivitiesStatus.loading;

    try {
      _activitiesData.value =
          await ActivitiesRepository.getAllActivities(accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = ActivitiesStatus.error;
    }
  }

  getDate() {
    DateTime convertedTimeStamp = DateTime.now();
    String formatedDateTime = DateFormat('dd MMM')
        .format(convertedTimeStamp); //DateFormat() is from intl package

    return formatedDateTime;
  }

  bool checkSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    MyLogger.printInfo(brightness.toString());

    return brightness == Brightness.light;
  }
}
