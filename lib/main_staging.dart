import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show PlatformDispatcher, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mynth_one_client/app/enums/flavor_enum.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/helpers/persistent_storage_helper.dart';
import 'package:mynth_one_client/app/instances/firebase_instances.dart';
import 'package:mynth_one_client/mynth_one_app.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      if (kDebugMode) {
        // Force disable Crashlytics collection while doing every day staging.
        // Temporarily toggle this to true if you want to test crash reporting.
        await crashlytics.setCrashlyticsCollectionEnabled(false);
      }
      FlutterError.onError = crashlytics.recordFlutterFatalError;
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        crashlytics.recordError(error, stack, fatal: true);
        return true;
      };

      await dotenv
          .load(fileName: '.env.staging')
          .then((_) => MyLogger.printInfo('STG ENV FILE LOADED'));

      // In order for the persistent storage to be ready when the app starts
      await GetStorage.init()
          .then((_) => MyLogger.printInfo('GET_STORAGE INITIALIZED'));

      final isDoneWithOnboarding =
          PersistentStorage.getIsDoneWithOnboardingValue();

      runApp(
        MynthOneApp(
          flavor: Flavor.staging,
          isDoneWithOnboarding: isDoneWithOnboarding,
        ),
      );
    },
    (error, stack) {
      crashlytics.setUserIdentifier(firebaseAuth.currentUser?.uid ?? 'Empty');
      crashlytics.recordError(error, stack, fatal: true);
    },
  );
}


/*
#Run app in `stg` environment
flutter run -t lib/main_staging.dart  --flavor=staging

# Run app in debug mode (Picks up debug signing config)
flutter run -t lib/main_staging.dart  --debug --flavor=staging

# Run app in release mode (Picks up release signing config)
flutter run -t lib/main_staging.dart  --release --flavor=staging

# Create appBundle for Android platform. Runs in release mode by default.
flutter build appbundle -t lib/main_staging.dart  --flavor=staging

# Create APK for staging flavor. Runs in release mode by default
* flutter build apk -t lib/main_staging.dart  --flavor=staging

# Create minified APK for staging flavor.
flutter build apk -t lib/main_staging.dart  --flavor=staging --split-per-abi --no-shrink
*/
