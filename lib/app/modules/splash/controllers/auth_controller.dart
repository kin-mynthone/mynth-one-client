import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mynth_one_client/app/helpers/my_logger_helper.dart';
import 'package:mynth_one_client/app/instances/firebase_instances.dart';

enum AuthStatus { unauthenticated, authenticated }

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final status = AuthStatus.unauthenticated.obs;
  late Worker _statusEverWorker;

  late Rx<User?> _firebaseUser;

  String currentState() =>
      'AuthController(status: ${status.value}, firebaseUser: ${_firebaseUser.value})';

  @override
  void onReady() {
    super.onReady();
    _monitorFirebaseUser();
    _monitorAuthStatus();
  }

  @override
  void onClose() {
    _firebaseUser.close();
    _statusEverWorker.dispose();
    super.onClose();
  }

  void _monitorFirebaseUser() {
    _firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    _firebaseUser.bindStream(firebaseAuth.authStateChanges());
    ever(_firebaseUser, (User? value) {
      if (value != null) {
        status.value = AuthStatus.authenticated;
      } else {
        status.value = AuthStatus.unauthenticated;
      }
    });
  }

  void _monitorAuthStatus() {
    _statusEverWorker = ever(
      status,
      (value) async {
        switch (value) {
          case AuthStatus.unauthenticated:
            MyLogger.printInfo(currentState());

            break;
          case AuthStatus.authenticated:
            MyLogger.printInfo(currentState());

            break;
        }
      },
    );
  }
}
