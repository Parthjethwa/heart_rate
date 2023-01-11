import 'package:flutter/material.dart';
import 'package:heart_rate/Home/BNB_all.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("Login Screen",
        style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text("Please enter your Username",
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child:  TextFormField(

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter UserName';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff1c1c1e),
                    /*  hintText: "Enter your email",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,

                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text("Please enter your Password",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child:  TextFormField(

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter UserName';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff1c1c1e),
                    /*  hintText: "Enter your email",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,

                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Expanded(child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBars()));
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
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 20),
              child: Text("By Clicking on the button you agree all the terms and conditions", style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center
                ,),
            )
          ],
        )
    );
  }
}
