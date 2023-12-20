// ignore_for_file: prefer_const_constructors

import 'package:tavkeer_assignment/exports.dart';
import 'package:tavkeer_assignment/features/auth/utils/date_dialog.dart';
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
          textController: fullName,
          required: true,
        ),
        const SizedBox(height: 15),

        //gender
        TextInputWidget(
          title: 'Gender',
          hint: 'Enter Gender',
          textController: gender,
          readOnly: true,
          required: true,
          trailingWidget: PopupMenuButton<String>(
            icon: Icon(Icons.keyboard_arrow_down, color: appThemeColor),
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                for (String option in ['Male', 'Female', 'Other'])
                  PopupMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ];
            },
            onSelected: (String value) {
              gender.text = value;
            },
          ),
        ),
        const SizedBox(height: 15),

        //dob
        TextInputWidget(
          title: 'D.O.B',
          hint: 'Enter D.O.B',
          textController: dob,
          readOnly: true,
          trailingWidget: Icon(
            Icons.calendar_month,
            color: appThemeColor,
          ),
          ontap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DateDialog(controller: dob);
              },
            );
          },
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
          keyboard: TextInputType.number,
          textController: phone,
          required: true,
        ),
        const SizedBox(height: 15),

        //age
        TextInputWidget(
          title: 'Age',
          hint: 'Enter Age',
          keyboard: TextInputType.number,
          textController: age,
          required: true,
        ),
        const SizedBox(height: 15),

        //address
        TextInputWidget(
          title: 'Address',
          hint: 'Enter Address',
          textController: address,
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
          textController: city,
          required: true,
        ),
        const SizedBox(height: 15),

        //state
        TextInputWidget(
          title: 'State',
          hint: 'Enter State',
          textController: state,
          required: true,
        ),
        const SizedBox(height: 15),

        //pincode
        TextInputWidget(
          title: 'Pincode',
          hint: 'Enter Pincode',
          textController: pinCode,
          required: true,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
