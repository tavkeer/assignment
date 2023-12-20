import 'package:tavkeer_assignment/exports.dart';

class SignUpController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool passwordLoading = RxBool(false);

  //set value for password
  void toggPasswordloading(bool value) => passwordLoading.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //resister
  Future<void> register(UserModel user) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      await addUserData(user);
      FirebaseAuth.instance.authStateChanges().listen(
        (user) {
          if (user != null) {
            debugPrint('registered');
            Get.offAll(() => const HomePage());
          } else {
            debugPrint('Not registered');
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.red.shade400,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      );
    }
    isLoading.value = false;
  }

  Future addUserData(UserModel user) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "id": FirebaseAuth.instance.currentUser!.uid,
        "fullName": user.fullName,
        "dob": user.dob,
        "gender": user.gender,
        "age": user.age,
        "city": user.city,
        "address": user.address,
        "state": user.state,
        "phone": user.phone,
        "email": user.email,
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.red.shade400,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      );
    }
  }
}
