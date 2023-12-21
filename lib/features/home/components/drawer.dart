import 'package:flutter/cupertino.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Al-Waqfat Al-Wāhidat \n  الوقفة الواحدة \n v1.0.0",
                    style: GoogleFonts.aBeeZee(
                      color: appThemeColor,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.star),
                    label: const Text("Rate Us"),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {
                      // NextScreen.nextScreenNormal(
                      //   context,
                      //   const FeedbackPage(),
                      // );
                    },
                    icon: const Icon(CupertinoIcons.chat_bubble),
                    label: const Text("Feedback"),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.exclamationmark),
                    label: const Text("About us"),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("Share this app"),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
