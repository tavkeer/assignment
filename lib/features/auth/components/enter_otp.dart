import 'package:tavkeer_assignment/exports.dart';

class EnterOtp extends StatelessWidget {
  final TextEditingController email;
  const EnterOtp({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    //body
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Obx(
        () => Get.find<OtpController>().showOtp.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter OTP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),

                  //enter otp here
                  const EnterOtpForm(),
                  const SizedBox(height: 20),

                  //resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Didn't receive OTP?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.black54,
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class EnterOtpForm extends StatelessWidget {
  const EnterOtpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController one = TextEditingController();
    final TextEditingController two = TextEditingController();
    final TextEditingController three = TextEditingController();
    final TextEditingController four = TextEditingController();

    void checkOtp() {
      final String otp =
          '${one.text.trim()}${two.text.trim()}${three.text.trim()}${four.text.trim()}';
      Get.find<OtpController>().verifyOtp(otp: otp.trim());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: Get.width - 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtpDigitHolder(controller: one),
            OtpDigitHolder(controller: two),
            OtpDigitHolder(controller: three),
            OtpDigitHolder(
              controller: four,
              onchanged: checkOtp,
            ),
          ],
        ),
      ),
    );
  }
}
