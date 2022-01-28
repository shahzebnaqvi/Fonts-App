import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fonts_project/home_main.dart';
import 'home_page.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
          child: Center(
            child: AnimatedSplashScreen(
                duration: 3000,
                centered: true,
                splashIconSize: 100,
                splash: Image.asset(
                  "assets/fonts.jpg",
                  fit: BoxFit.contain,
                ),
                nextScreen: HomePage(),
                splashTransition: SplashTransition.fadeTransition,
                // pageTransitionType: PageTransitionType.scale,
                backgroundColor: Colors.white),
          ),
        ),
      ),
    );
  }
}
