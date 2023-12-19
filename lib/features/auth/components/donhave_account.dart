import 'package:google_fonts/google_fonts.dart';
import 'package:tavkeer_assignment/exports.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: appThemeColor,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
