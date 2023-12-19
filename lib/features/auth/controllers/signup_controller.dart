import 'package:tavkeer_assignment/exports.dart';

class SignUpController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool passwordLoading = RxBool(false);

  RxBool rememberMeLoading = RxBool(false);

  //set value for password
  void toggPasswordloading(bool value) => passwordLoading.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //set value for remember me loading
  void toggleRememberMeloading(bool value) => rememberMeLoading.value = value;
}
