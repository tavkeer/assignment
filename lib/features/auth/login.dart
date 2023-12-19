import 'package:flutter/material.dart';
import 'package:tavkeer_assignment/widgets/textinput_widget.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //image section
              Image.asset(
                'assets/images/auth.png',
                fit: BoxFit.contain,
              ),

              //form Section
              const LoginForm(),

              //forgot and remember me section

              //login button

              //signup navigation
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      title: 'E-mail Address',
      hint: 'Enter E-mail Address',
      textController: TextEditingController(),
    );
  }
}
