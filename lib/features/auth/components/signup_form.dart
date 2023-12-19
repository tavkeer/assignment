// ignore_for_file: prefer_const_constructors

import 'package:tavkeer_assignment/exports.dart';
import 'package:tavkeer_assignment/features/auth/utils/show_password.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.email,
    required this.password,
    required this.gender,
    required this.dob,
    required this.fullName,
    required this.phone,
    required this.age,
    required this.address,
    required this.city,
    required this.state,
    required this.pinCode,
  });
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController gender;
  final TextEditingController dob;
  final TextEditingController fullName;
  final TextEditingController phone;
  final TextEditingController age;
  final TextEditingController address;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController pinCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //name
        TextInputWidget(
          title: 'Full Name',
          hint: 'Enter Full Name',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //gender
        TextInputWidget(
          title: 'Gender',
          hint: 'Enter Gender',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
          trailingWidget: Icon(
            Icons.keyboard_arrow_down,
            color: appThemeColor,
          ),
        ),
        const SizedBox(height: 15),

        //dob
        TextInputWidget(
          title: 'D.O.B',
          hint: 'Enter D.O.B',
          keyboard: TextInputType.emailAddress,
          textController: email,
          trailingWidget: Icon(
            Icons.calendar_month,
            color: appThemeColor,
          ),
          required: true,
        ),
        const SizedBox(height: 15),

        //email
        TextInputWidget(
          title: 'Email-Address',
          hint: 'Enter E-mail Address',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //password
        Obx(
          () => TextInputWidget(
            title: 'Password',
            hint: 'Enter Password ',
            textController: password,
            hidePass: Get.find<SignUpController>().passwordLoading.value,
            trailingWidget: PasswordsVisibilityWidget(),
            required: true,
          ),
        ),
        const SizedBox(height: 15),

        //mobile number
        TextInputWidget(
          title: 'Mobile Number',
          hint: 'Enter Mobile Numbe',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //age
        TextInputWidget(
          title: 'Age',
          hint: 'Enter Age',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //address
        TextInputWidget(
          title: 'Address',
          hint: 'Enter Address',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
          trailingWidget: ImageIcon(
            AssetImage('assets/icons/location.png'),
            size: 30,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),

        //city
        TextInputWidget(
          title: 'City',
          hint: 'Enter City',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //state
        TextInputWidget(
          title: 'State',
          hint: 'Enter State',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),

        //pincode
        TextInputWidget(
          title: 'Pincode',
          hint: 'Enter Pincode',
          keyboard: TextInputType.emailAddress,
          textController: email,
          required: true,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
