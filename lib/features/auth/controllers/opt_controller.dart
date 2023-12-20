import 'package:email_otp/email_otp.dart';
import 'package:tavkeer_assignment/exports.dart';

class OtpController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool showOtp = RxBool(false);

  EmailOTP myauth = EmailOTP();
  //set value for password
  void toggShowOtp(bool value) => showOtp.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //send otp
  Future<void> sendOtp(String email) async {
    debugPrint('Email in sendOtp: $email');
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
  }

  //verify opt
  Future<void> verifyOtp({required String otp}) async {
    debugPrint('OTP in sendOtp: $otp');

    final bool reslt = await myauth.verifyOTP(otp: otp);
    if (reslt == true) {
      Get.to(() => const Scaffold());
      myauth.printError();
    } else {
      debugPrint("not done");
    }
  }
}
