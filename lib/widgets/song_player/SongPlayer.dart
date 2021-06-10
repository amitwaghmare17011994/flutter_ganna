import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';

class SongPlayer extends StatefulWidget {
  final SongItem songItem;

  const SongPlayer({Key? key, required this.songItem, bool? isPlay})
      : super(key: key);

  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  bool isPlay = false;

  void togglePlay() {
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
    // Container(
    //   child: InkWell(
    //     splashColor: Colors.red,
    //     onTap: togglePlay,
    //     child: Ink(
    //         height: 100,
    //         width: 100,
    //         color: Colors.blue,
    //         child: Icon(
    //           icon,
    //           size: 100,
    //           color: Colors.white,
    //         )),
    //   ),
    // );
  }
}
