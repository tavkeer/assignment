import 'package:tavkeer_assignment/exports.dart';

class OtpController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool showOtp = RxBool(false);

  RxBool verifiedOtp = RxBool(false);

  //initialize the otp service
  EmailOTP myauth = EmailOTP();

  //set value for password
  void toggShowOtp(bool value) => showOtp.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //send otp
  Future<void> sendOtp(String email) async {
    debugPrint('Email in sendOtp: $email');
    isLoading.value = true;

    try {
      myauth.setConfig(
          appEmail: "shahtavkeerfourth@gmail.com",
          appName: "Tavkeer Assignment",
          userEmail: email,
          otpLength: 4,
          otpType: OTPType.digitsOnly);
      await myauth.sendOTP();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }

  //verify opt
  Future<void> verifyOtp({required String otp}) async {
    debugPrint('OTP in sendOtp: $otp');

    final bool reslt = await myauth.verifyOTP(otp: otp);
    if (reslt == true) {
      verifiedOtp.value = true;
    } else {
      Get.snackbar(
        'Error',
        "OTP doesn't match",
        colorText: Colors.black,
        backgroundColor: Colors.red.shade400,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
      );
      debugPrint("not done");
    }
  }
}
