import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'register.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(" "),
      //   backgroundColor: Color(0xFFd2edfd),
      //   elevation: 0.0,
      // ),
      body: Container(
        padding: EdgeInsets.only(top: 60),
        color: Color(0xFFd2edfd),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: Image(image: AssetImage("assets/images/abstract.png")),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 190,
                  child: Image(image: AssetImage("assets/images/mitrc.png")),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    width: 300,
                    child: Text(
                      "Fight of India with Corona\n\n",
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    )),
                Container(
                    width: 300,
                    child: Text(
                      "An App \nto",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    )),
                Row(
                  children: <Widget>[
                    Container(
                        //width: 300,
                        child: Text(
                      "Empower Citizens ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                    Container(
                        //width: 300,
                        child: Text(
                      " with Right Information",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                Container(
                    //  width: 300,
                    child: Text(
                  "about",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                )),
                Container(
                    //  width: 300,
                    child: Text(
                  "COVID19(Corona Virus)",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
                SizedBox(
                  height: 65.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 110,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            "LET'S STOP ",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image(
                            width: 100,
                            image: AssetImage("assets/images/covid19.png")),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Card(
                  child: Container(
                      width: 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFfbab66), Color(0xFFf7418c)])),
                      child: Center(
                        child: Text(
                          "Select Language",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 5.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(5.0),
                      child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Color(0xFFfbab66),
                                    Color(0xFFf7418c)
                                  ])),
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Login ",
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          )),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 5.0,
                    ),
                    Container(
                      child: Text("OR"),
                    ),
                    Card(
                      margin: EdgeInsets.all(5.0),
                      child: Container(
                          width: 80.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xFFfbab66),
                                    Color(0xFFf7418c)
                                  ])),
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          )),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 5.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
