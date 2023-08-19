import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/repositories/activities_repository.dart';
import 'package:intl/intl.dart';

enum DashboardActivitiesStatus { initial, loading, succeeded, failed, error }

class DashboardActivitiesController extends GetxController {
  static DashboardActivitiesController get instance => Get.find();

  late Worker _statusEverWorker;

  final _status = DashboardActivitiesStatus.initial.obs;

  final _activitiesData = <Data>[].obs;
  static RxBool isVerifying = false.obs;

  DashboardActivitiesStatus get status => _status.value;

  bool get isLoading => _status.value == DashboardActivitiesStatus.loading;
  bool get hasSucceeded => _status.value == DashboardActivitiesStatus.succeeded;
  bool get hasFailed => _status.value == DashboardActivitiesStatus.failed;

  List<Data> get activitiesData => _activitiesData;

  String currentState() =>
      'DashboardActivitiesController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getActivities();

    _monitorDashboardActivitiesStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorDashboardActivitiesStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case DashboardActivitiesStatus.error:
            MyLogger.printError(currentState());
            break;
          case DashboardActivitiesStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case DashboardActivitiesStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case DashboardActivitiesStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case DashboardActivitiesStatus.failed:
            break;
        }
      },
    );
  }

  Future<void> getActivities() async {
    // _status.value = DashboardActivitiesStatus.loading;

    try {
      _activitiesData.value =
          await ActivitiesRepository.getAllActivities(accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = DashboardActivitiesStatus.error;
    }
  }

  getDate() {
    DateTime convertedTimeStamp = DateTime.now();
    String formatedDateTime = DateFormat('dd MMM')
        .format(convertedTimeStamp); //DateFormat() is from intl package

    return formatedDateTime;
  }

  bool getSystemTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;

    return brightness == Brightness.light;
  }
}
