import 'package:tavkeer_assignment/exports.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
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

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: ProfileAppBar(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //profile image
            const ProfileBigImage(),

            //about
            Text(
              'General Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: appThemeColor,
              ),
            ),

            //details form
            UserDetailsForm(
              dob: dob,
              age: age,
              city: city,
              state: state,
              phone: phone,
              email: email,
              gender: gender,
              pinCode: pinCode,
              address: address,
              fullName: fullName,
            ),

            //sbutton
            const SizedBox(height: 10),
            const ProfileButton(),
          ],
        ),
      ),
    );
  }
}
