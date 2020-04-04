import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:covid19/asset_audio_player_icons.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final assets = <String>[
    "assets/audio/क्या करें   पीएम मोदी जी द्वारा.mp3",
    "assets/audio/अमिताभ-बच्चन-का-संदेश.mp3",
    "assets/audio/क्या-करें अमिताभ-बच्चन-जी-द्वारा.mp3",
    "assets/audio/पीएम-मोदी-जी-का-संदेश.mp3",
    "assets/audio/सामान्य जागरूकता ऑडियो अंग्रेजी.mp3",
    "assets/audio/सामान्य-जागरूकता-ऑडियो-हिंदी.mp3"   
  ];
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  var _currentAssetPosition = 0;

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
    _open(_currentAssetPosition);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton
              (padding:const EdgeInsets.only(top: 40.0) ,
                onPressed: (){
                  _assetsAudioPlayer.openPlaylist(Playlist(
                    assetAudioPaths: this.assets
                  ));
                },
                child: Text("Playlist of CORONO Awareness",style: TextStyle(color: Colors.white),),
                color: Color(0xFF2E7D32),
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