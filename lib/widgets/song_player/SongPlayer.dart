import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ganna/models/song_item.dart';
import 'package:flutter/foundation.dart';

class SongPlayer extends StatefulWidget {
  final SongItem songItem;

  const SongPlayer({Key? key, required this.songItem, bool? isPlay})
      : super(key: key);

  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool isPlay = false;
  late AudioPlayer player;
  late AudioCache audioCache;
  Duration _duration = new Duration();
  Duration _position = new Duration();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPlayer();
  }

  void setPlayer() async {
    player = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: player);
    await player.play(widget.songItem.previewUrl!);
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });
    player.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });

    player.onPlayerCompletion.listen((event) {
      setState(() {
        isPlay = true;
      });
    });
  }

  void togglePlay() async {
    var url = widget.songItem.previewUrl;

    if (isPlay) {
      if (url != null) {
        await player.play(url);
      }
    } else {
      await player.pause();
    }
    setState(() {
      isPlay = !isPlay;
    });
  }

  Future<bool> onBackPressed() async {
    var res = await player.stop();
    return res != null;
  }

  @override
  Widget build(BuildContext context) {
    var icon = isPlay ? Icons.play_circle_fill : Icons.pause_circle_filled;

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Container(
        height: 100,
        width: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
              child: Icon(
                icon,
                size: 100,
                color: Colors.redAccent,
              ),
              onTap: togglePlay),
          Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  Duration newDuration = Duration(seconds: value.toInt());
                  player.seek(newDuration);
                });
              }),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '       ${_position.toString().split(":")[1]} :  ${_position.toString().split(":")[2].split('.')[0]} ',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
              Text(
                  '${_duration.toString().split(":")[1]} :  ${_duration.toString().split(":")[2].split('.')[0]}       ',
                  style: TextStyle(color: Colors.redAccent))
            ],
          ),
        ]),
      ),
    );
  }
}
