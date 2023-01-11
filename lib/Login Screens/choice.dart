import 'package:flutter/material.dart';
import 'package:heart_rate/Login%20Screens/login_screen.dart';
import 'package:heart_rate/Login%20Screens/terms&cond.dart';

class Choice extends StatefulWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 20),
            child: Text("Welcome to Topia AI ECG",
              style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 18,),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 20),
            child: Text("Instant AFib detection at your\nfingertips Let's get started",
              style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/choice.png",),
            ),
          )),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child:Container(
                      height: 55,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink
                      ),
                      child: Text("Log In",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Terms_Cond()));
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1c1c1e)
                  ),
                  child: Text("Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
