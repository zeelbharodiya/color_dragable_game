//
//
//
//
// import 'package:flutter/material.dart';
//
// import 'globalclass.dart';
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
//
// class _HomePageState extends State<HomePage> {
//
//   late List<ItemModel> items;
//   late List<ItemModel>items2;
//
//   late int score;
//   late bool gameOver;
//
//   @override
//   void initState() {
//     super.initState();
//     initGame();
//   }
//
//   initGame(){
//     gameOver = false;
//     score=0;
//     items=[
//       ItemModel(icon: Icons.coffee,name:"Coffee", value:"Coffee"),
//       ItemModel(icon: Icons.star,name:"dog", value:"dog"),
//       ItemModel(icon: Icons.ac_unit,name:"Cat", value:"Cat"),
//       ItemModel(icon: Icons.start,name:"Cake", value: "Cake"),
//       ItemModel(icon: Icons.read_more,name:"bus", value:"bus"),
//     ];
//     items2 = List<ItemModel>.from(items);
//     items.shuffle();
//     items2.shuffle();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     if(items.length == 0)
//       gameOver = true;
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Matching Game'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Text.rich(TextSpan(
//                 children: [
//                   TextSpan(text: "Score: "),
//                   TextSpan(text: "$score", style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30.0,
//                   ))
//                 ]
//             )
//             ),
//             if(!gameOver)
//               Row(
//                 children: <Widget>[
//                   Column(
//                       children: items.map((item) {
//                         return Container(
//                           margin: const EdgeInsets.all(8.0),
//                           child: Draggable<ItemModel>(
//                             data: item,
//                             childWhenDragging: Icon(
//                               item.icon, color: Colors.grey,size: 50.0,),
//                             feedback: Icon(item.icon,color: Colors.teal,size: 50,),
//                             child: Icon(item.icon, color: Colors.teal, size:50,),
//                           ),
//                         );
//
//
//                       }).toList()
//                   ),
//                   Spacer(
//
//                   ),
//                   Column(
//                       children: items2.map((item){
//                         return DragTarget<ItemModel>(
//                           onAccept: (receivedItem){
//                             if(item.value== receivedItem.value){
//                               setState(() {
//                                 items.remove(receivedItem);
//                                 items2.remove(item);
//                                 score+=10;
//                                 item.accepting =false;
//                               });
//
//                             }else{
//                               setState(() {
//                                 score-=5;
//                                 item.accepting =false;
//
//                               });
//                             }
//                           },
//                           onLeave: (receivedItem){
//                             setState(() {
//                               item.accepting=false;
//                             });
//                           },
//                           onWillAccept: (receivedItem){
//                             setState(() {
//                               item.accepting=true;
//                             });
//                             return true;
//                           },
//                           builder: (context, acceptedItems,rejectedItem) => Container(
//                             color: item.accepting? Colors.red:Colors.teal,
//                             height: 50,
//                             width: 100,
//                             alignment: Alignment.center,
//                             margin: const EdgeInsets.all(8.0),
//                             child: Text(item.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
//                                 fontSize: 18.0),),
//                           ),
//
//
//                         );
//
//                       }).toList()
//
//                   ),
//                 ],
//               ),
//             if(gameOver)
//               Text("GameOver", style: TextStyle(
//                 color: Colors.red,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24.0,
//               ),),
//             if(gameOver)
//               Center(
//                 child: ElevatedButton(
//                   // textColor: Colors.white,
//                   // color: Colors.pink,
//                   child: Text("New Game"),
//                   onPressed: ()
//                   {
//                     initGame();
//                     setState(() {
//
//                     });
//                   },
//                 ),
//               )
//
//           ],
//         ),
//
//       ),
//     );
//   }
// }
