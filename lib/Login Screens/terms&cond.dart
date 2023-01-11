import 'package:flutter/material.dart';
import 'package:heart_rate/Login%20Screens/create_acc.dart';

class Terms_Cond extends StatefulWidget {
  const Terms_Cond({Key? key}) : super(key: key);

  @override
  State<Terms_Cond> createState() => _Terms_CondState();
}

class _Terms_CondState extends State<Terms_Cond> {

  bool _checkbox = false;
  bool _checkbox1 = false;
  bool _checkbox2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text("Account Creation ( 1 / 3 )", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text("Terms of Service & Privacy Policy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.pink),),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
            child: Text("We value your privacy. Before you continue, please take a moment to review our policies.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          Row(
            children: [
              Checkbox(
                  shape: CircleBorder(
                      side: BorderSide()
                  ),
                value: _checkbox,
                onChanged: (value) {
                  setState(() {
                    _checkbox = !_checkbox;
                  });
                },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.pink;
                    }
                    return Colors.pink;
                  })
              ),
              Text('I confirm i am 18 years old.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Checkbox(
                  shape: CircleBorder(
                      side: BorderSide()
                  ),
                value: _checkbox1,
                onChanged: (value) {
                  setState(() {
                    _checkbox1 = !_checkbox1;
                  });
                },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.pink;
                    }
                    return Colors.pink;
                  })
              ),
              Text('I agree to the Terms of Service and\nPrivacy Policy.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Checkbox(
                shape: CircleBorder(
                  side: BorderSide()
                ),
                value: _checkbox2,
                onChanged: (value) {
                  setState(() {
                    _checkbox2 = !_checkbox2;
                  });
                },
                  checkColor: Colors.black,
                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    else if (states.contains(MaterialState.selected)) {
                      return Colors.pink;
                    }
                    return Colors.pink;
                  })
              ),
              Expanded(child: Text('I consent to receive marketing communications from Topia about products and services. I can opt out time, as describe in the privacy policy.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
              ),)
            ],
          ),
          Expanded(child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAcc()));
                },
                child:Container(
                  height: 50,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 30),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink
                  ),
                  child: Text("Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ),
          ),
        ],
      ),
    );
  }
}
