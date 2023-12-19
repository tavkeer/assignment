import 'package:tavkeer_assignment/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase platform specification
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //status bar color reflected here
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}
