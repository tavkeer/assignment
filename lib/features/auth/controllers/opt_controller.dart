import 'package:email_otp/email_otp.dart';
import 'package:tavkeer_assignment/exports.dart';

class OtpController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool showOtp = RxBool(false);

  //set value for password
  void toggShowOtp(bool value) => showOtp.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //send otp
  Future<void> sendOtp(String email) async {
    print('Email in sendOtp: $email');
    try {
      EmailOTP myauth = EmailOTP();
      myauth.setConfig(
          appEmail: "shahtavkeerfourth@gmail.com",
          appName: "Assignment",
          userEmail: email,
          otpLength: 4,
          otpType: OTPType.digitsOnly);
      await myauth.sendOTP();
      // if (await myauth.sendOTP() == true) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(
      //     content: Text("OTP has been sent"),
      //   ));
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>   OtpScreen(myauth: myauth,)));
      // }
      // else {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(
      //     content: Text("Oops, OTP send failed"),
      //   ));
      // }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //verify opt
  Future<void> verifyOtp({required String otp}) async {
    print('OTP in sendOtp: $otp');
    EmailOTP myauth = EmailOTP();

    if (await myauth.verifyOTP(otp: otp) == true) {
      Get.to(() => const Scaffold());
      myauth.printError();
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("OTP is verified"),
      // ));
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print("not done");

      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("Invalid OTP"),
      // ));
    }
  }
}
