import 'package:get_storage/get_storage.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';

class PersistentStorage {
  static final _box = GetStorage();

  static const IS_DONE_WITH_ONBOARDING = 'isDoneWithOnboarding';

  static bool getIsDoneWithOnboardingValue() {
    return _box.read(IS_DONE_WITH_ONBOARDING) ?? false;
  }

  static Future<void> setIsDoneWithOnboardingKey({required bool value}) async {
    try {
      await _box.write(IS_DONE_WITH_ONBOARDING, value);
      MyLogger.printInfo('IS_DONE_WITH_ONBOARDING $value');
    } catch (e) {
      MyLogger.printError(e);
    }
  }
}
