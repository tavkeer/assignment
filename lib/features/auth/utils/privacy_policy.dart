import 'package:google_fonts/google_fonts.dart';
import 'package:tavkeer_assignment/exports.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By signing in you are agreeing our\n',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 10,
              ),
            ),
            TextSpan(
              text: 'Terms & privacy policy',
              style: TextStyle(
                color: appThemeColor,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.inter().fontFamily,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
