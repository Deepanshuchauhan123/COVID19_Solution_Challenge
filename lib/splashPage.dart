import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'globalVar.dart' as global;
import 'homePage.dart';

class SplashPage extends StatefulWidget {
  //AudioPlayer audio = AudioPlayer();
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //AudioPlayer audio = AudioPlayer();
  static AudioCache player = AudioCache();
  //final player = AudioCache();
  bool flag = false;
  @override
  void initState() {
    player.play(global.lang + ".mp3");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF3180e4),
            Color(0xFF564dc2),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            Image(width: 300, image: AssetImage("assets/images/covid19.png")),
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: 240,
              height: 240,
              child: MaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.speaker_phone,
                  color: Colors.white,
                  size: 200,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10.0),
                      ]),
                  child: Center(
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text("Next")),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
