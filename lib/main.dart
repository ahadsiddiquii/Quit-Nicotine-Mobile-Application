import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'Screens/login_screen.dart';
import 'Screens/start_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  if (Firebase.apps.length == 0) {
    print("Firebase not initialized");
  } else {
    print("Firebase is initialized");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // brightness: Brightness.dark,
            unselectedWidgetColor: Colors.white),
        home:
            // LoginScreen(),
            StartUp(),
      );
    });
  }
}
