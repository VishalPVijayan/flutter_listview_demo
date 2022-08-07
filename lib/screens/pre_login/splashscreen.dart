import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'loginscreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'Images/hutechlogo.png',
      screenFunction: () async{
        return Login();
      },
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}