import 'package:tavkeer_assignment/exports.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // controllers
    final TextEditingController dob = TextEditingController();
    final TextEditingController age = TextEditingController();
    final TextEditingController city = TextEditingController();
    final TextEditingController state = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController gender = TextEditingController();
    final TextEditingController pinCode = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController fullName = TextEditingController();
    final TextEditingController password = TextEditingController();

    //check for the controllers before register
    bool checkFields() {
      if (fullName.text.trim().isNotEmpty &&
          gender.text.trim().isNotEmpty &&
          dob.text.trim().isNotEmpty &&
          email.text.trim().isNotEmpty &&
          password.text.trim().length > 6 &&
          phone.text.trim().length == 10 &&
          age.text.trim().isNotEmpty &&
          address.text.trim().isNotEmpty &&
          city.text.trim().isNotEmpty &&
          state.text.trim().isNotEmpty &&
          pinCode.text.trim().isNotEmpty) {
        debugPrint("good to go");
        debugPrint(fullName.text.trim());
        debugPrint(gender.text.trim());
        debugPrint(dob.text.trim());
        debugPrint(email.text.trim());
        debugPrint(password.text.trim());
        debugPrint(phone.text.trim());
        debugPrint(age.text.trim());
        debugPrint(address.text.trim());
        debugPrint(city.text.trim());
        debugPrint(state.text.trim());
        debugPrint(pinCode.text.trim());
        return true;
      } else {
        debugPrint("validate first");

        //show snack bar
        Get.snackbar(
          'Error',
          "Some Fields are Empty",
          colorText: Colors.black,
          backgroundColor: Colors.red.shade400,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        );
        return false;
      }
    }

    //body
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image section
                const ImageSection(text: 'Sign Up'),

                //form Section
                const SizedBox(height: 10),
                SignUpForm(
                  email: email,
                  password: password,
                  gender: gender,
                  dob: dob,
                  fullName: fullName,
                  phone: phone,
                  age: age,
                  address: address,
                  city: city,
                  state: state,
                  pinCode: pinCode,
                ),

                //privacy policy section
                const SizedBox(height: 30),
                const PrivacyPolicy(),

                //login button
                const SizedBox(height: 15),
                CustomButton(
                  title: 'Register',
                  controller: Get.find<SignUpController>().isLoading,
                  ontap: () {
                    if (checkFields() == true) {
                      Get.to(
                        () => OtpPage(
                          email: email,
                          user: UserModel(
                            fullName: fullName.text.trim(),
                            dob: dob.text.trim(),
                            gender: gender.text.trim(),
                            age: age.text.trim(),
                            city: city.text.trim(),
                            address: address.text.trim(),
                            state: state.text.trim(),
                            phone: phone.text.trim(),
                            email: email.text.trim(),
                            password: password.text.trim(),
                          ),
                        ),
                      );
                    }
                  },
                ),

                //divider
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Color(0xFFD9D9D9)),
                const SizedBox(height: 10),

                //signup navigation
                ToggleLoginAndRegister(
                  titleText: 'Already have an account? ',
                  actionText: 'Login',
                  ontap: () => Get.off(() => const LoginPage()),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
