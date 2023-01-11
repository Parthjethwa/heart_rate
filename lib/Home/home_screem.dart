import 'package:flutter/material.dart';
import 'package:heart_rate/Home/connect_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff1c1c1e),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("Topia AI ECG", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Hello, Parth", style: TextStyle(fontSize: 28,color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Get started by taking your ECG", style: TextStyle(fontSize: 16,color: Colors.grey,),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff1c1c1e)
              ),
              child: Image.asset("assets/img_8.png"),
            ),
            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterBlueApp()));},
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.pink)
                ),
                child: Center(
                  child: Text("Connect to ECG device", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text("Health Diary",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text("<   January 08, 2023   >",
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
              padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today check ECG 1st time at 9:45AM"),
                  SizedBox(height: 5,),
                  Text("Today check ECG 1st time at 9:50AM"),
                  SizedBox(height: 5,),
                  Text("Today check ECG 1st time at 9:60AM"),
                  SizedBox(height: 5,),
                  Text("Today check ECG 1st time at 10:00AM"),
                  SizedBox(height: 5,),
                  Text("Today check ECG 1st time at 10:10AM"),
                  SizedBox(height: 5,),
                  Text("Today check ECG 1st time at 10:30AM"),

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
