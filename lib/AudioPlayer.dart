import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:covid19/asset_audio_player_icons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final assets = <String>[
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.49.55 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.06 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.18 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.20 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.24 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.28 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.29 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.30 PM (1).mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.30 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.31 PM.mpeg",
    "assets/audio/WhatsApp Audio 2020-03-23 at 1.50.32 PM.mpeg"   
  ];
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  var _currentAssetPosition = -1;

  void _open(int assetIndex) {
    _currentAssetPosition = assetIndex % assets.length;
    _assetsAudioPlayer.open(assets[_currentAssetPosition]);
  }

  void _playPause() {
    _assetsAudioPlayer.playOrPause();
  }

  void _next() {
    if(_assetsAudioPlayer.playlist != null){
      _assetsAudioPlayer.playlistNext();
    } else {
      _currentAssetPosition++;
      _open(_currentAssetPosition);
    }
  }

  void _prev() {
    if(_assetsAudioPlayer.playlist != null){
      _assetsAudioPlayer.playlistPrevious();
    } else {
      _currentAssetPosition--;
      _open(_currentAssetPosition);
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  _assetsAudioPlayer.openPlaylist(Playlist(
                    assetAudioPaths: this.assets
                  ));
                },
                child: Text("Playlist of CORONO "),
                color: Color(0xFF426bd7),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _assetsAudioPlayer.current,
                  initialData: const PlayingAudio(),
                  builder: (BuildContext context, AsyncSnapshot<PlayingAudio> snapshot) {
                    final PlayingAudio currentAudio = snapshot.data;
                    return ListView.builder(
                      itemBuilder: (context, position) {
                        return ListTile(
                            title: Text(assets[position]
                                .split("/")
                                .last, style: TextStyle(color: assets[position] == currentAudio.assetAudioPath ? Colors.blue : Colors.black)),
                            onTap: () {
                              _open(position);
                            });
                      },
                      itemCount: assets.length,
                    );
                  },
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: <Widget>[
              //     StreamBuilder(
              //       stream: _assetsAudioPlayer.isLooping,
              //       initialData: false,
              //       builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              //         return RaisedButton(
              //           child: Text(snapshot.data ? "Looping" : "Not looping"),
              //           onPressed: () {
              //             _assetsAudioPlayer.toggleLoop();
              //           },
              //         );
              //       },
              //     ),
              //     SizedBox(width: 20),
              //     RaisedButton(
              //       child: Text("Seek to 2:00"),
              //       onPressed: () {
              //         _assetsAudioPlayer.seek(Duration(minutes: 2));
              //       },
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: _assetsAudioPlayer.currentPosition,
                    initialData: const Duration(),
                    builder: (BuildContext context, AsyncSnapshot<Duration> snapshot) {
                      Duration duration = snapshot.data;
                      return Text(durationToString(duration));
                    },
                  ),
                  Text(" - "),
                  StreamBuilder(
                    stream: _assetsAudioPlayer.current,
                    builder: (BuildContext context, AsyncSnapshot<PlayingAudio> snapshot) {
                      Duration duration = Duration();
                      if (snapshot.hasData) {
                        duration = snapshot.data.duration;
                      }
                      return Text(durationToString(duration));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: _prev,
                    icon: Icon(AssetAudioPlayerIcons.to_start),
                    iconSize: 40,
                  ),
                  StreamBuilder(
                    stream: _assetsAudioPlayer.isPlaying,
                    initialData: false,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return IconButton(
                        onPressed: _playPause,
                         icon: Icon(snapshot.data ? AssetAudioPlayerIcons.pause : AssetAudioPlayerIcons.play),
                         iconSize: 40,
                      );
                    },
                  ),
                  IconButton(
                     icon: Icon(AssetAudioPlayerIcons.to_end),
                     iconSize: 40,
                    onPressed: _next,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}