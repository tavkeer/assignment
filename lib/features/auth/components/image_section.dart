import 'package:tavkeer_assignment/exports.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
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
            'Login',
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
