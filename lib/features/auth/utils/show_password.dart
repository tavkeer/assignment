import 'package:tavkeer_assignment/exports.dart';

class PasswordsVisibilityWidget extends StatelessWidget {
  final void Function()? ontap;
  const PasswordsVisibilityWidget({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return (Get.find<SignUpController>().passwordLoading.value)
        ? IconButton(
            icon: Icon(
              Icons.visibility_off,
              color: appThemeColor,
            ),
            onPressed: () {
              passwordVisible(false);
            },
          )
        : IconButton(
            icon: Icon(
              Icons.visibility,
              color: appThemeColor,
            ),
            onPressed: () {
              passwordVisible(true);
            },
          );
  }

  void passwordVisible(bool value) {
    Get.find<SignUpController>().toggPasswordloading(value);
  }
}
