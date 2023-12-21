// ignore_for_file: unused_local_variable

import 'package:tavkeer_assignment/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //appbar
              HomeAppBar(ontap: () => scaffoldKey.currentState!.openDrawer()),

              //user info
              const ProfileInfoWidget(),

              //events
              const ViewAllWidget(text: 'Upcomming Events'),
              const HotEventsWidget(),

              //event list
              const ViewAllWidget(text: 'Campus Upates'),
              const EventList()
            ],
          ),
        ),
      ),
    );
  }
}
