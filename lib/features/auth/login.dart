import 'package:tavkeer_assignment/exports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //email
    final TextEditingController email = TextEditingController();

    //password
    final TextEditingController password = TextEditingController();

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
                const ImageSection(text: 'Login'),

                //form Section
                const SizedBox(height: 10),
                LoginForm(email: email, password: password),

                //forgot and remember me section
                const ForgotPassword(),

                //privacy policy section
                const PrivacyPolicy(),

                //login button
                const SizedBox(height: 15),
                CustomButton(
                  title: 'Login',
                  ontap: () {},
                ),

                //divider
                const SizedBox(height: 10),
                const Divider(thickness: 1, color: Color(0xFFD9D9D9)),
                const SizedBox(height: 10),

                //signup navigation
                ToggleLoginAndRegister(
                  titleText: "Don't have an account? ",
                  actionText: 'Sign Up',
                  ontap: () => Get.off(() => const SignUpPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
