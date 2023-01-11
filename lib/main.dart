import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heart_rate/Login%20Screens/choice.dart';

import 'Login Screens/terms&cond.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     /* theme: ThemeData(
          fontFamily:"ubuntu"
      ),*/
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Choice()
            )
        )
    );
  }

  bool started = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      /*appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),*/
      body:
          Container(
            child: Image.asset("assets/splash2.jpg",
            fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          )
          /*CircularProgressIndicator(
            color: Colors.white,
          )*/

    );
  }
}
