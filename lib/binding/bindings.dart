import 'package:get/get.dart';
import 'package:tavkeer_assignment/features/auth/controllers/login_controller.dart';
import 'package:tavkeer_assignment/features/auth/controllers/opt_controller.dart';
import 'package:tavkeer_assignment/features/auth/controllers/signup_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(OtpController());
  }
}
