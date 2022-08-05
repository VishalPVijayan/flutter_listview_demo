import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.yellow),
    );
  }
}
