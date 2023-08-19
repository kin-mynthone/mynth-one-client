import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show PlatformDispatcher, kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      final orientations = [DeviceOrientation.portraitUp];
      await SystemChrome.setPreferredOrientations(orientations);
      await Firebase.initializeApp()
          .then((_) => MyLogger.printInfo('FIREBASE INITIALIZED'));

      // Kill all used ports and restart firebase emulators
      // To install the kill-port npm package, run npm install --global kill-port
      // kill-port --port 9099,5001,8080,8085,9199 && firebase emulators:start --project dev --only functions
      // Temporarily toggle this to true if you want to use firebase emulators
      const isUsingFirebaseEmulator = false;
      // ignore: dead_code
      if (isUsingFirebaseEmulator) {
        await _connectToFirebaseEmulator(
          isLocalCloudFunction: false,
          isLocalFirebaseAuth: false,
          isLocalFirebaseStorage: false,
          isLocalFirestore: false,
        );
        MyLogger.printInfo('FIREBASE EMULATOR IS IN USE');
      }

      if (kDebugMode) {
        // Force disable Crashlytics collection while doing every day development.
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
          .load(fileName: '.env.development')
          .then((_) => MyLogger.printInfo('DEV ENV FILE LOADED'));

      // In order for the persistent storage to be ready when the app starts
      await GetStorage.init()
          .then((_) => MyLogger.printInfo('GET_STORAGE INITIALIZED'));

      final isDoneWithOnboarding =
          PersistentStorage.getIsDoneWithOnboardingValue();

      runApp(
        MynthOneApp(
          flavor: Flavor.development,
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

// https://firebase.google.com/docs/emulator-suite/connect_and_prototype
Future<void> _connectToFirebaseEmulator({
  required bool isLocalCloudFunction,
  required bool isLocalFirebaseAuth,
  required bool isLocalFirebaseStorage,
  required bool isLocalFirestore,
}) async {
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  // You can get these port numbers from firebase.json
  if (isLocalFirebaseAuth) {
    await firebaseAuth.useAuthEmulator(localHost, 9099);
  }

  if (isLocalFirebaseStorage) {
    await firebaseStorage.useStorageEmulator(localHost, 9199);
  }

  if (isLocalCloudFunction) {
    functions.useFunctionsEmulator(localHost, 5001);
  }

  if (isLocalFirestore) {
    firestore.settings = Settings(
      host: '$localHost:8080',
      persistenceEnabled: false,
      sslEnabled: false,
    );
  }
}

/*
#Run app in `dev` environment
flutter run -t lib/main_development.dart  --flavor=development

# Run app in debug mode (Picks up debug signing config)
flutter run -t lib/main_development.dart  --debug --flavor=development

# Run app in release mode (Picks up release signing config)
flutter run -t lib/main_development.dart  --release --flavor=development

# Create appBundle for Android platform. Runs in release mode by default.
flutter build appbundle -t lib/main_development.dart  --flavor=development

# Create APK for dev flavor. Runs in release mode by default.
flutter build apk -t lib/main_development.dart  --flavor=development

# Create minified APK for dev flavor.
flutter build apk -t lib/main_development.dart  --flavor=development --split-per-abi --no-shrink
*/
