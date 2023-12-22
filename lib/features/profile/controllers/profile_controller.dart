import 'package:tavkeer_assignment/exports.dart';

class ProfileController extends GetxController {
  RxBool readOnly = RxBool(true);
  RxBool isloading = RxBool(false);

  // Future<void> updateUser(UserModel user) async {
  //   UserModel prevData = Get.find<LoginController>().userData;
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .update({
  //       "fullName": (user.fullName != '') ? user.fullName : prevData.fullName,
  //       "dob": (user.dob != '') ? user.dob : prevData.dob,
  //       "gender": (user.gender != '') ? user.gender : prevData.gender,
  //       "age": (user.age != '') ? user.age : prevData.age,
  //       "city": (user.city != '') ? user.city : prevData.city,
  //       "address": (user.address != '') ? user.address : prevData.address,
  //       "state": (user.state != '') ? user.state : prevData.state,
  //       "phone": (user.phone != '') ? user.phone : prevData.phone,
  //       "email": (user.email != '') ? user.email : prevData.email,
  //       "pincode": (user.pinCode != '') ? user.pinCode : prevData.pinCode,
  //     });
  //     Get.offAll(() => const HomePage());
  //   } on FirebaseException catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.message.toString(),
  //       colorText: Colors.black,
  //       backgroundColor: Colors.red.shade400,
  //       snackPosition: SnackPosition.BOTTOM,
  //       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //     );
  //   }
  // }
}
