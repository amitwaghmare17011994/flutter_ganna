import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ganna/models/song_item.dart';
import 'package:flutter/foundation.dart';

class SongPlayer extends StatefulWidget {
  final SongItem songItem;
  final ValueSetter<bool> togglePlay;

  const SongPlayer(
      {Key? key,
      required this.songItem,
      bool? isPlay,
      required this.togglePlay})
      : super(key: key);

  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool isPlay = false;

  void togglePlay() {
    widget.togglePlay(isPlay);
    setState(() {
      isPlay = !isPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = isPlay ? Icons.play_arrow : Icons.pause;

    return Container(
      height: 100,
      width: 100,
      child: GestureDetector(
          child: Icon(icon, color: Colors.white, size: 100), onTap: togglePlay),
    );
  }
}
