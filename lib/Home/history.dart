import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff1c1c1e),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text("History", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green
                ),
                margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Generate Report", style: TextStyle(fontSize: 20,  color: Colors.white),),
                    Row(
                      children: [
                        Expanded(child:                     Text("Export up to 31 days of data into a summary report", style: TextStyle(fontSize: 17,  color: Colors.white),),
                        ),
                        Container(
                          child: Icon(Icons.badge, size: 30, color: Colors.black,),
                        )
                      ],
                    )
                  ],
                )
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff1c1c1e),
                    ),
                    margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 7, right: 7),
                    width: double.infinity,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Manual Recording", style: TextStyle(fontSize: 14, color: Colors.white),),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text("Normal", style: TextStyle(fontSize: 17, color: Colors.white),),
                            Expanded(child:  Container(
                              alignment: Alignment.centerRight,
                              child: Text("120",
                                style: TextStyle(fontSize: 17, color: Colors.white),
                              ),
                            )),
                            SizedBox(width: 11,),
                            Text("80",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            SizedBox(width:11,),
                            Text("72",
                              style: TextStyle(fontSize: 17, color: Colors.white),

                            ),
                            Image.asset("assets/heart.png", height: 20,),
                            SizedBox(width: 5,),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text("Jan 09, 2023 at 5:30PM", style: TextStyle(fontSize: 17, color: Colors.white),),
                            Expanded(child:  Container(
                              alignment: Alignment.centerRight,
                              child: Text("SYS",
                                style: TextStyle(fontSize: 17, color: Colors.white),
                              ),
                            )),
                            SizedBox(width: 5,),
                            Text("DIA",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            SizedBox(width: 5,),
                            Text("BPM",
                              style: TextStyle(fontSize: 17, color: Colors.white),

                            ),
                            SizedBox(width: 5,),
                          ],
                        )
                      ],
                    ),
                  );
                }),

          ],
        ),
      )

    );
  }
}
