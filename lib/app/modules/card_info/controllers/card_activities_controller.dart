import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';
import 'package:mynth_one_client/app/repositories/activities_repository.dart';
import 'package:intl/intl.dart';

enum CardActivitiesStatus { initial, loading, succeeded, failed, error }

class CardActivitiesController extends GetxController {
  static CardActivitiesController get instance => Get.find();

  late Worker _statusEverWorker;

  final _status = CardActivitiesStatus.initial.obs;

  final _activitiesData = <Data>[].obs;
  static RxBool isVerifying = false.obs;

  CardActivitiesStatus get status => _status.value;

  bool get isLoading => _status.value == CardActivitiesStatus.loading;
  bool get hasSucceeded => _status.value == CardActivitiesStatus.succeeded;
  bool get hasFailed => _status.value == CardActivitiesStatus.failed;

  List<Data> get activitiesData => _activitiesData;

  String currentState() =>
      'CardActivitiesController(_status: ${_status.value}, ';

  @override
  void onInit() {
    super.onInit();
    MyLogger.printInfo(currentState());
    getActivities();

    _monitorCardActivitiesStatus();
  }

  @override
  void onClose() {
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorCardActivitiesStatus() {
    _statusEverWorker = ever(
      _status,
      (value) {
        switch (value) {
          case CardActivitiesStatus.error:
            MyLogger.printError(currentState());
            break;
          case CardActivitiesStatus.loading:
            MyLogger.printInfo(currentState());
            break;
          case CardActivitiesStatus.initial:
            MyLogger.printInfo(currentState());
            break;
          case CardActivitiesStatus.succeeded:
            MyLogger.printInfo(currentState());
            //TODO: add event here
            break;
          case CardActivitiesStatus.failed:
            break;
        }
      },
    );
  }

  Future<void> getActivities() async {
    // _status.value = CardActivitiesStatus.loading;

    try {
      _activitiesData.value =
          await ActivitiesRepository.getCardActivities(accessToken: 'sample');
    } catch (e) {
      MyLogger.printError(e);

      _status.value = CardActivitiesStatus.error;
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
