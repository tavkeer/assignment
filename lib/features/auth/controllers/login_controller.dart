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

      debugPrint("user :${userData.email.toString()}");
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
}
