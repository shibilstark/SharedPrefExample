
import 'package:flutter/material.dart';
import 'Screens/screen_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(22, 22, 34, 0),
      ),
      home: SplashScreen(),
    );
  }
}
