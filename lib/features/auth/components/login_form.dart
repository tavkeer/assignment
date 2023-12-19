// ignore_for_file: prefer_const_constructors

import 'package:tavkeer_assignment/exports.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.email,
    required this.password,
  });
  final TextEditingController email;

  //password
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputWidget(
          title: 'Email-Address',
          hint: 'Enter E-mail Address',
          keyboard: TextInputType.emailAddress,
          textController: email,
        ),
        const SizedBox(height: 15),
        Obx(
          () => TextInputWidget(
            title: 'Password',
            hint: 'Enter Password ',
            textController: password,
            hidePass: Get.find<LoginController>().passwordLoading.value,
            trailingWidget: PasswordVisibilityWidget(),
          ),
        ),
      ],
    );
  }
}
