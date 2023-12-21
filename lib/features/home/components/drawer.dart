import 'package:tavkeer_assignment/exports.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    Column(
                      children: [
                        Text(
                          'Hi, ${Get.find<LoginController>().name.value}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          Get.find<LoginController>().phone.value,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appThemeColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: (90 * 40) / 100,
                    decoration: BoxDecoration(
                      color: appThemeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                'Your profile is 40% Completed',
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'View/Edit Profile',
                style: TextStyle(
                  color: appThemeColor,
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //courses
                    SizedBox(height: 10),
                    DrawerListItem(img: 'courses.png', title: 'My Courses'),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //certificate
                    SizedBox(height: 10),
                    DrawerListItem(
                      img: 'certificate.png',
                      title: 'My Certificates',
                    ),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //saved
                    SizedBox(height: 10),
                    DrawerListItem(img: 'Saved.png', title: 'Saved'),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //help
                    SizedBox(height: 10),
                    DrawerListItem(img: 'help.png', title: 'Help'),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //about us
                    SizedBox(height: 10),
                    DrawerListItem(img: 'People.png', title: 'About Us'),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //T&C
                    SizedBox(height: 10),
                    DrawerListItem(
                      img: 'Terms and Conditions.png',
                      title: 'T & C',
                    ),
                    Divider(thickness: 1, color: Color(0x25121212)),

                    //settings
                    SizedBox(height: 10),
                    DrawerListItem(img: 'Vector.png', title: 'Settings'),
                    Divider(thickness: 1, color: Color(0x25121212)),
                    //button
                  ],
                ),
              ),
              const Spacer(),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final String img;
  final String title;
  const DrawerListItem({
    super.key,
    required this.img,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage('assets/icons/$img'),
          color: appThemeColor,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: drawerStyle,
        )
      ],
    );
  }
}
