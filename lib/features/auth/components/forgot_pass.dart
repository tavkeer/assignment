import 'package:tavkeer_assignment/exports.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Checkbox(
            value: Get.find<LoginController>().rememberMeLoading.value,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            activeColor: appThemeColor,
            onChanged: (value) {
              Get.find<LoginController>().toggleRememberMeloading(value!);
            },
          ),
        ),
        const Text(
          'Remember Me',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            //forgot password email to be sent from here
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: appThemeColor,
            ),
          ),
        ),
      ],
    );
  }
}
