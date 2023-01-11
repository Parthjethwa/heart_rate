import 'package:flutter/material.dart';
import 'package:heart_rate/Login%20Screens/setdetails.dart';
import 'package:heart_rate/Login%20Screens/terms&cond.dart';

class CreateAcc extends StatefulWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {

  TextEditingController _email = TextEditingController();
  TextEditingController _confirmemail = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        /*backgroundColor:  Color(0xff171f38),*/
        actions: [
          GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Container(
              margin: EdgeInsets.only(top: 7, bottom: 7, right: 10),
              padding: EdgeInsets.only(left: 7, right: 7),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Center(
                child: Icon(Icons.cancel, color: Colors.grey,size: 40,),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Account Creation ( 2 / 3 )", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Create Your Account", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Email Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child:  TextFormField(
                controller: _email,
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
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text("Confirm Email Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _confirmemail,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                   /* hintText: "Enter your email again",*/
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
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text("Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                  /*  hintText: "Enter your Password",*/
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
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text("Your password must include:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  Icon(Icons.done, size: 25,color: Colors.green),
                  SizedBox(width: 12,),
                  Text("8-20 characters (no space)",style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  Icon(Icons.done, size: 25,color: Colors.green),
                  SizedBox(width: 12,),
                  Text("At least one upper case character",style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  Icon(Icons.done, size: 25,color: Colors.green),
                  SizedBox(width: 12,),
                  Text("At least one lower case character",style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  Icon(Icons.done, size: 25,color: Colors.green,),
                  SizedBox(width: 12,),
                  Text("At least one number character",style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text("Country", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _country,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Country';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                   /* hintText: "Enter your Country",*/
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
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SetDetails()));
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink
                ),
                child: Text("Create Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
