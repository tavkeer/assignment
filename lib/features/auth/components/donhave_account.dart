import 'package:tavkeer_assignment/exports.dart';

class ToggleLoginAndRegister extends StatelessWidget {
  final String titleText;
  final String actionText;
  final void Function() ontap;
  const ToggleLoginAndRegister(
      {super.key,
      required this.titleText,
      required this.actionText,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ontap,
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: titleText,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: actionText,
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
      ),
    );
  }
}
