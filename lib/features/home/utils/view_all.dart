import 'package:tavkeer_assignment/exports.dart';

class ViewAllWidget extends StatelessWidget {
  final String text;
  const ViewAllWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: appThemeColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.snackbar(
                "Alert!",
                "CommingSoon",
                margin: const EdgeInsets.only(bottom: 5),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.grey.shade200,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 1, color: appThemeColor),
              ),
              child: Text(
                'View all',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.nunito().fontFamily,
                  fontSize: 16,
                  color: appThemeColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
