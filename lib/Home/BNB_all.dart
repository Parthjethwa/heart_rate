import 'package:flutter/material.dart';
import 'package:heart_rate/Home/care.dart';
import 'package:heart_rate/Home/history.dart';
import 'package:heart_rate/Home/profile.dart';

import 'home_screem.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {

  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
    const History(),
    const Profilee(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Container buildMyNavBar(BuildContext context)
  {
    return Container(
      height: 55,
      color: Color(0xff1c1c1e),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon:  pageIndex == 0
                  ? Image.asset("assets/bnb/img.png", height: 70, color: Colors.pink,)
                  : Image.asset("assets/bnb/img.png", height: 60, color: Colors.grey,)
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon:  pageIndex == 1
                  ? Image.asset("assets/bnb/img_1.png", height: 70, color: Colors.pink,)
                  : Image.asset("assets/bnb/img_1.png", height: 60, color: Colors.grey,)
          ),
         /* IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon:  pageIndex == 2
                  ? Image.asset("assets/bnb/img_2.png", height: 60, color: Colors.pink,)
                  : Image.asset("assets/bnb/img_2.png", height: 60, color: Colors.grey,)
          ),*/
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon:  pageIndex == 2
                  ? Image.asset("assets/bnb/img_3.png", height: 60, color: Colors.pink,)
                  : Image.asset("assets/bnb/img_3.png", height: 60, color: Colors.grey,)
          ),
        ],
      ),
    );
  }
}
