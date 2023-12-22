import 'package:hive/hive.dart';
import 'package:tavkeer_assignment/exports.dart';

class LoginController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxBool passwordLoading = RxBool(false);

  RxBool rememberMeLoading = RxBool(false);

  late UserModel userData;

  RxString name = RxString('');

  RxString phone = RxString('');

  //set value for password
  void toggPasswordloading(bool value) => passwordLoading.value = value;

  //set value for loading
  void toggloading(bool value) => isLoading.value = value;

  //set value for remember me loading
  void toggleRememberMeloading(bool value) => rememberMeLoading.value = value;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.authStateChanges().listen(
        (user) async {
          if (user != null) {
            debugPrint('registered');
            await getUserData();
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

  Future getUserData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      final data = snapshot.data() as Map<String, dynamic>;
      userData = UserModel.fromJson(data);
      name.value = userData.fullName!;
      phone.value = userData.phone!;

      //save locally
      saveLocal(data);
    } on FirebaseException catch (e) {
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

  Future<void> resetPassword(String email) async {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(email)) {
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
        'Error',
        'Email has been sent to $email',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      );
    } on FirebaseException catch (e) {
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

  Future saveLocal(Map<String, dynamic> data) async {
    final localUserDetails = Hive.box('userDetails');
    localUserDetails.put('email', data['email']);
    localUserDetails.put('address', data['address']);
    localUserDetails.put('age', data['age']);
    localUserDetails.put('city', data['city']);
    localUserDetails.put('dob', data['dob']);
    localUserDetails.put('state', data['state']);
    localUserDetails.put('fullName', data['fullName']);
    localUserDetails.put('gender', data['gender']);
    localUserDetails.put('phone', data['phone']);
    localUserDetails.put('pincode', data['pincode']);
  }
}
