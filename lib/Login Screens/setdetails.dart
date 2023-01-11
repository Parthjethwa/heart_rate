import 'package:flutter/material.dart';
import 'package:heart_rate/Login%20Screens/login_success.dart';
import 'package:heart_rate/Login%20Screens/terms&cond.dart';
import 'package:intl/intl.dart';

class SetDetails extends StatefulWidget {
  const SetDetails({Key? key}) : super(key: key);

  @override
  State<SetDetails> createState() => _SetDetailsState();
}

class _SetDetailsState extends State<SetDetails> {

  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _gender = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        toolbarHeight: 30,
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Account Creation ( 3 / 3 )", style: TextStyle(fontSize: 15,color: Colors.grey, fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("Set Up Your Profile", style: TextStyle(fontSize: 23,color: Colors.pink, fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text("First Name", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child:  TextFormField(
                controller: _name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter UserName';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                  /*  hintText: "Enter your Name",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                        color: Colors.white
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
              child: Text("Last Name", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _surname,
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
               /*     hintText: "Enter your Surname",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                        color: Colors.white
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
              child: Text("Date Of Birth", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey,fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child:  TextFormField(
                readOnly: true,
                style: TextStyle(
                  fontWeight: FontWeight.w700,),
                controller: _dob,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white
                  ),
                  filled: true,
                  fillColor: Color(0xff1c1c1e),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.pink,
                    ),
                    onPressed: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context)
                          .requestFocus(FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.utc(1900),
                          lastDate: DateTime.now()));
                      _dob.text =
                          formatter.format(date!);
                    },
                  ),
                 /* hintText: 'Select Birthdate date',*/
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text("Height", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _height,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Height';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                   /* hintText: "Enter your Height",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                        color: Colors.white
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
              child: Text("Weight", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _weight,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Height';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                    /*hintText: "Enter your Weight",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                        color: Colors.white
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
              child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 16),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              padding: EdgeInsets.only(top: 0),
              height: 45,
              child: TextFormField(
                controller: _gender,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Gender';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    filled: true,
                    fillColor:  Color(0xff1c1c1e),
                   /* hintText: "Enter your Gender",*/
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 20),
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
