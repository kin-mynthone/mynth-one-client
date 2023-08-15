import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/repositories/activities_repository.dart';
import 'package:intl/intl.dart';

enum PartialActivitiesStatus { initial, loading, succeeded, failed, error }

class PartialActivitiesController extends GetxController {
  static PartialActivitiesController get instance => Get.find();

  late Worker _statusEverWorker;

  final _status = PartialActivitiesStatus.initial.obs;

  final _activitiesData = <Data>[].obs;
  static RxBool isVerifying = false.obs;

  PartialActivitiesStatus get status => _status.value;

  bool get isLoading => _status.value == PartialActivitiesStatus.loading;
  bool get hasSucceeded => _status.value == PartialActivitiesStatus.succeeded;
  bool get hasFailed => _status.value == PartialActivitiesStatus.failed;

  List<Data> get activitiesData => _activitiesData;

  String currentState() =>
      'PartialActivitiesController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getActivities();

    _monitorPartialActivitiesStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorPartialActivitiesStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case PartialActivitiesStatus.error:
            MyLogger.printError(currentState());
            break;
          case PartialActivitiesStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case PartialActivitiesStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case PartialActivitiesStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case PartialActivitiesStatus.failed:
            break;
        }
      },
    );
  }

  Future<void> getActivities() async {
    // _status.value = PartialActivitiesStatus.loading;

    try {
      _activitiesData.value = await ActivitiesRepository.getPartialActivities(
          accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = PartialActivitiesStatus.error;
    }
  }

  getDate() {
    DateTime convertedTimeStamp = DateTime.now();
    String formatedDateTime = DateFormat('dd MMM')
        .format(convertedTimeStamp); //DateFormat() is from intl package

    return formatedDateTime;
  }

  getTime(int timestamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formattedDateTime = DateFormat('hh:mm aa').format(dateTime);
    return formattedDateTime;
  }

  getTitle(String name, bool received) {
    var split = name.split(' ');
    var lastInitial = split[1][0];

    if (received) {
      return 'From ${split[0]} $lastInitial.';
    } else {
      return 'To ${split[0]} $lastInitial.';
    }
  }
}
