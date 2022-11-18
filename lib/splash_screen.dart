import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gpa_calculator/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff334562),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('GPA\nCalculator',textAlign: TextAlign.center,speed: Duration(milliseconds: 100),textStyle: TextStyle(
              fontSize: 50,
              fontFamily: 'Georgia',
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            )),
            // TypewriterAnimatedText('Calculator',speed: Duration(milliseconds: 100),textStyle: TextStyle(
            //   fontSize: 40,
            //   fontFamily: 'Georgia',
            //   fontWeight: FontWeight.bold,
            //   color: Colors.white60,
            // )),
          ],
        )
      ),
    );
  }
}
