import 'package:tavkeer_assignment/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase platform specification
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //status bar ans gesture bar color here
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}
