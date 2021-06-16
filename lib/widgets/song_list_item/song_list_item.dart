import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';

class SongListItem extends StatefulWidget {
  final SongItem songItem;

  const SongListItem({Key? key, required this.songItem}) : super(key: key);

  @override
  _SongListItemState createState() => _SongListItemState();
}

class _SongListItemState extends State<SongListItem> {
  @override
  Widget build(BuildContext context) {
    var songItem = widget.songItem;
    var img = songItem.artworkUrl100;

    return Row(
      children: [Image.network(img!)],
    );
  }
}
