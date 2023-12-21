import 'package:tavkeer_assignment/exports.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.offAll(() => const LoginPage());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appThemeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 7,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                'Log Out',
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
    );
  }
}
