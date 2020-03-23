import 'package:covid19/BasicHomePage.dart';
import 'package:covid19/Chatboat.dart';
import 'package:covid19/DashboardPage.dart';
import 'package:covid19/NewsPage.dart';
import 'package:covid19/UpdatePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int pageIndex =0;
  int _currentIndex=0;
  final List<Widget> _children =[
    UpdatePage(),
    NewsPage(),
    CarouselDemo(),
    Chatboat(),
    DashboardPage(),

  ];
@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
    body:_children[_currentIndex],
    //  appBar: AppBar(
    //  backgroundColor: Colors.white,
    //  title: Center(child: Image.asset("assets/images/mitrc.png")), 
    //  Text("Fight against COVID19",
    //  style: TextStyle(color: Colors.black),),
    //  ),

    appBar: AppBar(
              //  backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Image.asset("assets/images/co2.jpeg",width: 30.0,height: 30.0,),
                
                ),
              
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                   Text('Fight against CORONO'),
                ]
              ),),

    // body: Container
    // (
      
    //   color: Colors.blueAccent,
    //   height: MediaQuery.of(context).size.height,
    //   width:  MediaQuery.of(context).size.height,
    //   // child: Column
    //   //   (
    //   //   mainAxisAlignment: MainAxisAlignment.center,
    //   //   children: <Widget>
    //   //   [
    //   //     Text("This is COVID19",
    //   //     style: TextStyle(color: Colors.white
    //   //                     ),
    //   //         )   
    //   //   ],
    //   //   ),
        
    // ),
    
    bottomNavigationBar: CurvedNavigationBar(
     
      height: 50,
      
      items: <Widget>[
        
        Icon(Icons.update,size: 20,color: Colors.black),
        Icon(Icons.tv,size: 20,color: Colors.black),
        Icon(Icons.home,size: 20,color: Colors.black),
        Icon(Icons.chat,size: 20,color: Colors.black),
        Icon(Icons.dashboard,size: 20,color: Colors.black),
      ],
      animationDuration: Duration(
        milliseconds: 200
      ),
      onTap: onTappedBar,
      // index: 2,
      animationCurve: Curves.bounceInOut,
    ),

  );
}

  void onTappedBar(int index) {
    setState(() {
      
      _currentIndex=index;
    });
  }
}
// class covidimage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage=AssetImage('assets/images/mitrc.png');
//     Image image=Image(image: assetImage,width: 100.0,height: 100.0,);
  
//     // TODO: implement build
//     return Container(child: image,);
//   }
// }