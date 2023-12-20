import 'package:tavkeer_assignment/exports.dart';
import 'package:tavkeer_assignment/features/auth/components/enter_otp.dart';

class OtpPage extends StatelessWidget {
  final UserModel user;
  const OtpPage({
    super.key,
    required this.email,
    required this.user,
  });

  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    //body
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image section
                Center(child: Image.asset('assets/images/otp.png')),

                //form Section
                const SizedBox(height: 70),
                TextInputWidget(
                  title: 'E-mail Address',
                  hint: email.text.trim(),
                  textController: email,
                  readOnly: true,
                ),
                const SizedBox(height: 5),

                //opt entering screen
                EnterOtp(email: email),

                //login button
                const SizedBox(height: 5),
                Obx(
                  () => CustomButton(
                    controller: Get.find<SignUpController>().isLoading,
                    title: (!Get.find<OtpController>().showOtp.value)
                        ? 'Get OTP'
                        : 'Continue',
                    ontap: () {
                      if (Get.find<OtpController>().verifiedOtp.value) {
                        Get.find<SignUpController>().register(user);
                      } else {
                        Get.find<OtpController>().toggShowOtp(true);
                        Get.find<OtpController>().sendOtp(email.text);
                      }
                    },
                  ),
                ),

                //divider
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFD9D9D9),
                ),
                const SizedBox(height: 10),

                //signup navigation
                ToggleLoginAndRegister(
                  titleText: "Already have an account? ",
                  actionText: 'Login',
                  ontap: () => Get.off(() => const LoginPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
