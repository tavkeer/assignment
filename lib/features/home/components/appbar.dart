import 'package:tavkeer_assignment/exports.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? ontap;
  const HomeAppBar({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.menu,
                size: 20,
                color: appThemeColor,
              ),
            ),
          ),
          Text(
            'MentorX',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: appThemeColor,
            ),
          ),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 20,
              color: appThemeColor,
            ),
          ),
        ],
      ),
    );
  }
}
