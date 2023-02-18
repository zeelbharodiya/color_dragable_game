import 'package:flutter/material.dart';

import '../models/globalclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isColor = false;
  bool accept = false;

  int score = 0;
  bool gameOver = false;
  late List color;
  late List color1;

  allValue() {
    score = 0;
     color =[
      allData(color: Colors.red,name:"RED", value:"RED"),
      allData(color: Colors.green,name:"GREEN", value:"GREEN"),
      allData(color: Colors.orange,name:"ORANGE", value:"ORANGE"),
      allData(color: Colors.blue,name:"BLUE", value: "BLUE"),
      allData(color: Colors.purple,name:"PURPLE", value:"PURPLE"),
    ];

     color1 =[
      allData(color: Colors.orange,name:"ORANGE", value:"ORANGE"),
      allData(color: Colors.purple,name:"PURPLE", value:"PURPLE"),
      allData(color: Colors.red,name:"RED", value:"RED"),
      allData(color: Colors.green,name:"GREEN", value:"GREEN"),
      allData(color: Colors.blue,name:"BLUE", value: "BLUE"),
    ];

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drop Game",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25,letterSpacing: 2),
        ),
        actions: [
          Row(
            children: [
              Text("Score : ",style: TextStyle(color: Colors.grey,fontSize: 20,),),
              Text("$score",style: TextStyle(color: Colors.pinkAccent,fontSize: 24,fontWeight: FontWeight.w600),),
              SizedBox(width: 10,),
            ],
          ),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if(gameOver == false) Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...color
                        .map(
                          (e) => Draggable(
                            data: e,
                            childWhenDragging: Container(),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 110.0,left: 20),
                              child: Text(e.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: e.color,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            feedback: Padding(
                              padding: const EdgeInsets.only(top: 110.0,left: 20),
                              child: Text(
                                e.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: e.color,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
                SizedBox(width: 130,),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    ...color1
                        .map(
                          (ele) => Padding(
                            padding: const EdgeInsets.only(top: 30.0,right: 20),
                            child: DragTarget<allData>(
                              onAccept: (data) {
                                if(ele.value == data.value){
                                  setState(() {
                                    color.remove(data);
                                    color1.remove(ele);
                                    score = score + 10;
                                    ele.accepting =false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.black,
                                          // elevation: 10,
                                          // behavior: SnackBarBehavior.floating,
                                          // margin: EdgeInsets.all(15),
                                            content: Center(child:
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Score",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                                                SizedBox(height: 15,),
                                                Text("$score",style: TextStyle(color: Colors.pinkAccent,fontSize: 22,fontWeight: FontWeight.w600),),
                                                SizedBox(height: 50,),
                                                Text("Dropped Sccessfully!",style: TextStyle(color: Colors.green,fontSize: 22,letterSpacing: 3),),
                                              ],
                                            )),
                                        ));
                                  });

                                }else{
                                  setState(() {
                                    score-=10;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.black,
                                          // elevation: 10,
                                          // behavior: SnackBarBehavior.floating,
                                          // margin: EdgeInsets.all(15),
                                          content: Center(child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Score",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 15,),
                                              Text("$score",style: TextStyle(color: Colors.pinkAccent,fontSize: 22,fontWeight: FontWeight.w600),),
                                              SizedBox(height: 50,),
                                              Text("Dropped not sccessfully!",style: TextStyle(color: Colors.red,fontSize: 22,letterSpacing: 3),),
                                            ],
                                          )),
                                        ));

                                  });
                                }
                              },
                              // onAcceptWithDetails: (data) {
                              //   data == 'GOOD';
                              //   },
                              onWillAccept: (data) {
                                // if(data == ele.value){
                                //   return true;
                                // } else {
                                //   return false;
                                // }
                               setState(() {
                                 ele.accepting = true;
                               });
                               return true;
                              },
                              builder: (BuildContext context, List candidateData, List rejectedData) {
                                return Container(
                                  height: 110,
                                  width: 110,
                                  color:  ele.color,
                                );
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ],
            ),

            if(color.length == 0)
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 90,),

                  (score > 30) ? Image.network("https://img.freepik.com/premium-photo/3d-winner-pedestal-with-trophy-cups-golden-with-star-first-second-third-podium-cartoon-minimal-cute-smooth-purple-background-3d-render-illustration_598821-604.jpg")
                               : Image.network("https://o.remove.bg/downloads/0e91594e-0829-4826-b69b-ba29488a8b1d/download-removebg-preview.png"),

                  if(color.length == 0)
                  Text("Score",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  if(color.length == 0)
                  Text("$score",style: TextStyle(color: Colors.pinkAccent,fontSize: 27,fontWeight: FontWeight.w600),),

                  SizedBox(height: 30,),

                  if(color.length == 0)
                    Text("GameOver", style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),),
                  SizedBox(height: 20,),
                  if(color.length == 0)
                    Center(
                      child: ElevatedButton(
                        // textColor: Colors.white,
                        // color: Colors.pink,
                        child: Text("New Game",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,letterSpacing: 2),),
                        onPressed: ()
                        {
                          setState(() {
                            allValue();
                          });
                        },
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: (color.length == 0) ? Color(0xffe3beea) : Colors.white,
    );
  }
}
