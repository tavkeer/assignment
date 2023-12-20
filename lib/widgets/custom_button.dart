import 'package:tavkeer_assignment/exports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? ontap;
  final dynamic controller;
  const CustomButton({
    super.key,
    required this.title,
    this.ontap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: appThemeColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Adjust the radius as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
          child: Obx(
            () => (controller.value)
                ? const Loading()
                : Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
