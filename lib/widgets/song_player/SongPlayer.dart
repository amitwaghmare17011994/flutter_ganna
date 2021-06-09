import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';

class SongPlayer extends StatefulWidget {
  final SongItem songItem;

  const SongPlayer({Key? key, required this.songItem}) : super(key: key);

  _SongPlayerState createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('song player'),
    );
  }
}
