import 'package:tavkeer_assignment/exports.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Text(
        'My Profile',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: appThemeColor,
        ),
      ),
      centerTitle: true,
      actions: [
        Obx(
          () => GestureDetector(
            onTap: () => Get.find<ProfileController>().readOnly.value = false,
            child: (Get.find<ProfileController>().readOnly.value)
                ? Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 80,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: appThemeColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                                semanticLabel: 'Edit',
                              ),
                              SizedBox(width: 5),
                              Text('Edit')
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
