import 'package:tavkeer_assignment/exports.dart';

class HotEventsWidget extends StatelessWidget {
  const HotEventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 205,
      width: Get.width,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              SizedBox(
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/event.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/event.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/event.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
              count: 3,
              controller: pageController,
              effect: SlideEffect(
                paintStyle: PaintingStyle.fill,
                strokeWidth: 2,
                dotColor: Colors.grey.shade300,
                activeDotColor: appThemeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
