import 'package:tavkeer_assignment/exports.dart';

class ProfileButton extends StatelessWidget {
  final UserModel user;
  const ProfileButton({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => ElevatedButton(
          onPressed: () {
            if (Get.find<ProfileController>().readOnly.value) {
            } else {
              Navigator.pop(context);
              Get.find<ProfileController>().readOnly.value = true;
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: (Get.find<ProfileController>().readOnly.value)
                ? appThemeColor.withOpacity(0.6)
                : appThemeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            child: (Get.find<ProfileController>().isloading.value)
                ? const Loading()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
