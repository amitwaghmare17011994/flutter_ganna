import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ganna/models/song_item.dart';
import 'package:flutter/foundation.dart';
// import 'package:ganna/widgets/music_virtualizer/music_virtualizer.dart';

class SongPlayer extends StatefulWidget {
  final SongItem songItem;
  final ValueSetter onExpandToggle;
  const SongPlayer(
      {Key? key,
      required this.songItem,
      bool? isPlay,
      required this.onExpandToggle})
      : super(key: key);

  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool hidePlayer = false;
  bool isPlay = false;
  late AudioPlayer player;
  late AudioCache audioCache;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  bool isExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPlayer();
    Timer(Duration(seconds: 6), () => {hidePlayer = true});
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
    var expandIcon = isExpanded ? Icons.fullscreen_exit : Icons.fullscreen;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Column(children: [
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: GestureDetector(
                    child: Icon(
                      icon,
                      size: 100,
                      color: Colors.white,
                    ),
                    onTap: togglePlay),
              )
            ])
          ],
        ),
        Spacer(),
        Slider(
            inactiveColor: Colors.white,
            value: _position.inMicroseconds.toDouble(),
            min: 0.0,
            max: _duration.inMicroseconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                Duration newDuration = Duration(microseconds: value.toInt());
                player.seek(newDuration);
              });
            }),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '       ${_position.toString().split(":")[1]} : ${_position.toString().split(":")[2].split('.')[0]} ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
                '${_duration.toString().split(":")[1]} : ${_duration.toString().split(":")[2].split('.')[0]}       ',
                style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                widget.onExpandToggle(!isExpanded);
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Icon(
                expandIcon,
                size: 50,
                color: Colors.red,
              ),
            )
          ],
        ),
      ]),
    );
  }
}
