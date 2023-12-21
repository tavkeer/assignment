import 'package:tavkeer_assignment/exports.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    Get.find<LoginController>().getUserData();
    super.onInit();
  }
}
