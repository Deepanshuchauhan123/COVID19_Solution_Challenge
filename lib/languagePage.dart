import 'package:covid19/splashPage.dart';
import 'package:flutter/material.dart';
import 'globalVar.dart' as global;

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Please Select Your Language\nकृपया अपनी भाषा चुनें",
                style: TextStyle(fontSize: 22.0),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                global.lang = "english";
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF3180e4),
                          Color(0xFF564dc2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                width: 170,
                height: 170,
                child: Center(
                    child: Text(
                  "English",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                global.lang = "hindi";
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF3180e4),
                          Color(0xFF564dc2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                width: 170,
                height: 170,
                child: Center(
                    child: Text(
                  "हिंदी",
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
