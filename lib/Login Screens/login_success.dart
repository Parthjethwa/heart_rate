import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heart_rate/Home/BNB_all.dart';
import 'package:heart_rate/Home/connect_screen.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    BottomNavigationBars(

                )
            )
        )
    );
  }

  bool isdone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Your Profile is completed!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Container(
            child: Image.asset("assets/img_6.png"),
          ),
          SizedBox(height: 40,),
          Container(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              color: Color(0xff171f38),
            ),
          )
        ],
      ),
    );
  }
}
