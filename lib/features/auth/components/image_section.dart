import 'package:tavkeer_assignment/exports.dart';

class ImageSection extends StatelessWidget {
  final String text;

  const ImageSection({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/auth.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Text(
            text,
            style: TextStyle(
              color: appThemeColor,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
