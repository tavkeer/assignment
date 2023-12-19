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

    //controller initialize
    Get.put(LoginController());
    Get.put(SignUpController());

    //body
    return Scaffold(
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
                  ontap: () {},
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
                  titleText: 'Already have an account? ',
                  actionText: 'Login',
                  ontap: () => Get.off(
                    () => const LoginPage(),
                  ),
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
