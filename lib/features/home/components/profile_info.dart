import 'package:tavkeer_assignment/exports.dart';
import 'package:tavkeer_assignment/features/profile/prifile_page.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProfilePage()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Text(
                    'Hi, ${Get.find<LoginController>().name.value}',
                    style: TextStyle(
                      color: appThemeColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Good Morning',
                  style: TextStyle(
                    color: appThemeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
