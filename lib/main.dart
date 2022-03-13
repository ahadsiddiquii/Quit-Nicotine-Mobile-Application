import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Screens/login_screen.dart';
import 'Screens/start_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                // brightness: Brightness.dark,
                unselectedWidgetColor:Colors.white
            ),
            home:
            // LoginScreen(),
            StartUp(),
          );
        }
    );
  }
}
