import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    // appBar: AppBar(backgroundColor: Colors.white,
    // title: Text("Flutter App",style: 
    // TextStyle(color: Colors.black),),),

    body: Container
    (
      color: Colors.blueAccent,
      height: MediaQuery.of(context).size.height,
      width:  MediaQuery.of(context).size.height,
      child: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>
        [
          Text("This is COVID19",
          style: TextStyle(color: Colors.white
                          ),
              )   
        ],
        ),
    ),
    bottomNavigationBar: CurvedNavigationBar(
      height: 50,
      items: <Widget>[
        
        Icon(Icons.video_library,size: 20,color: Colors.black),
        Icon(Icons.home,size: 20,color: Colors.black),
        Icon(Icons.question_answer,size: 20,color: Colors.black),
      ],
      animationDuration: Duration(
        milliseconds: 200
      ),
      index: 1,
      animationCurve: Curves.bounceInOut,
      onTap: (index){
        debugPrint("Current Index is $index");
      },
    ),

  );
}
}