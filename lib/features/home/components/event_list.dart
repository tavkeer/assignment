import 'package:tavkeer_assignment/exports.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const EventListItem(),
      ),
    );
  }
}

class EventListItem extends StatelessWidget {
  const EventListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/image.png'),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const ImageIcon(
                      AssetImage('assets/images/play.png'),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 7),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Convocation Day\nVideo',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: appThemeColor.withOpacity(0.5),
                      size: 16,
                    ),
                    const Flexible(
                      child: Text(
                        '2Block A - Auditorium 2nd Floor',
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF848484),
                          fontSize: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Flexible(
                  child: Text(
                    'lorem ipsum lorem ipsum lorem\nipsum lorem ipsum lorem ipsum',
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF848484),
                      fontSize: 9,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '20 Aug 2023 12:45pm',
                  maxLines: 3,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 6,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
