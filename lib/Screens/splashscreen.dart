import 'dart:async';
import 'package:anime_info_application/Screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(241, 241, 241, 0.98),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(animatedTexts: [
             
              ColorizeAnimatedText("Anime App",
                  textStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic,
                      fontSize: 70,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  colors: [
                    Colors.blue,
                    Colors.yellow,
                    Colors.deepPurple,
                    Colors.red,
                    Colors.transparent
                  ],
                  speed: Duration(seconds: 1)),
            ])
          ],
        )
            ),
      ),
    );
  }
}
