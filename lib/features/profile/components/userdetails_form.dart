import 'package:tavkeer_assignment/exports.dart';
import 'package:tavkeer_assignment/features/auth/utils/date_dialog.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({
    super.key,
    required this.dob,
    required this.age,
    required this.city,
    required this.state,
    required this.phone,
    required this.email,
    required this.gender,
    required this.pinCode,
    required this.address,
    required this.fullName,
  });

  final TextEditingController dob;
  final TextEditingController age;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController gender;
  final TextEditingController pinCode;
  final TextEditingController address;
  final TextEditingController fullName;

  @override
  Widget build(BuildContext context) {
    UserModel user = Get.find<LoginController>().userData;
    // fullName.text = user.fullName!;
    // dob.text = user.dob!;
    // age.text = user.age!;
    // city.text = user.city!;
    // state.text = user.state!;
    // phone.text = user.phone!;
    // email.text = user.email!;
    // gender.text = user.gender!;
    // pinCode.text = user.pinCode!;
    // address.text = user.address!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //username
            TextInputWidget(
              title: 'Full Name',
              hint: user.fullName!,
              textController: fullName,
              readOnly: Get.find<ProfileController>().readOnly.value,
              gap: 0,
            ),
            const SizedBox(height: 10),

            //dob and gender
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: TextInputWidget(
                    title: 'D.O.B',
                    hint: user.dob!,
                    textController: dob,
                    readOnly: Get.find<ProfileController>().readOnly.value,
                    gap: 0,
                    trailingWidget: Icon(
                      Icons.calendar_month,
                      color: appThemeColor,
                    ),
                    ontap: () {
                      if (!Get.find<ProfileController>().readOnly.value) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DateDialog(controller: dob);
                          },
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: Obx(
                    () => TextInputWidget(
                      title: 'Gender',
                      gap: 0,
                      hint: user.gender!,
                      textController: gender,
                      readOnly: Get.find<ProfileController>().readOnly.value,
                      required: false,
                      trailingWidget:
                          (!Get.find<ProfileController>().readOnly.value)
                              ? PopupMenuButton<String>(
                                  icon: Icon(Icons.keyboard_arrow_down,
                                      color: appThemeColor),
                                  itemBuilder: (context) {
                                    return <PopupMenuEntry<String>>[
                                      for (String option in [
                                        'Male',
                                        'Female',
                                        'Other'
                                      ])
                                        PopupMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                    ];
                                  },
                                  onSelected: (String value) {
                                    gender.text = value;
                                  },
                                )
                              : Icon(Icons.keyboard_arrow_down,
                                  color: appThemeColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: TextInputWidget(
                    title: 'Age',
                    hint: user.age!,
                    textController: age,
                    readOnly: Get.find<ProfileController>().readOnly.value,
                    gap: 0,
                  ),
                ),
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: TextInputWidget(
                    title: 'City',
                    hint: user.city!,
                    textController: city,
                    readOnly: Get.find<ProfileController>().readOnly.value,
                    gap: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            TextInputWidget(
              title: 'Address',
              hint: user.address!,
              textController: address,
              readOnly: Get.find<ProfileController>().readOnly.value,
              gap: 0,
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: TextInputWidget(
                    title: 'State',
                    hint: user.state!,
                    textController: state,
                    readOnly: Get.find<ProfileController>().readOnly.value,
                    gap: 0,
                  ),
                ),
                SizedBox(
                  width: Get.width * 2 / 5,
                  child: TextInputWidget(
                    gap: 0,
                    title: 'Pincode',
                    hint: user.pinCode!,
                    textController: pinCode,
                    readOnly: Get.find<ProfileController>().readOnly.value,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //about
            Text(
              'General Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: appThemeColor,
              ),
            ),
            const SizedBox(height: 10),

            TextInputWidget(
              title: 'Mobile Number',
              hint: user.phone!,
              textController: phone,
              readOnly: Get.find<ProfileController>().readOnly.value,
              gap: 0,
            ),
            const SizedBox(height: 10),
            TextInputWidget(
              title: 'Email Address',
              hint: user.email!,
              textController: email,
              readOnly: Get.find<ProfileController>().readOnly.value,
              gap: 0,
              trailingWidget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    const AssetImage('assets/images/tick.png'),
                    color: appThemeColor,
                  ),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: appThemeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
