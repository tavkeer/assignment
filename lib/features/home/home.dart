import 'package:tavkeer_assignment/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          child: const Text('Signout'),
        ),
      ),
    );
  }
}
