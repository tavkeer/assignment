import 'package:tavkeer_assignment/exports.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white,
      color: appThemeColor,
    );
  }
}
