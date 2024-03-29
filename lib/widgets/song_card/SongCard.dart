import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';
import 'package:ganna/widgets/skeleton/skeleton.dart';

class SongCard extends StatefulWidget {
  final SongItem songItem;
  final ValueSetter<SongItem> onSongSelect;

  SongCard({Key? key, required this.songItem, required this.onSongSelect})
      : super(key: key);

  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    SongItem songItem = widget.songItem;
    var artistName = songItem.artistName != null ? songItem.artistName : '';
    var songName = songItem.trackName != null ? songItem.trackName : '';
    var img = songItem.artworkUrl100 != null ? songItem.artworkUrl100 : '';
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            widget.onSongSelect(songItem);
          },
          child: Column(
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: img!,
                width: 400,
                placeholder: (context, url) => Skeleton(),
              ),
              ListTile(
                leading: Icon(
                  Icons.play_circle_fill,
                  color: Colors.purple,
                ),
                title: Text(songName!),
                subtitle: Text(
                  artistName!,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ));
  }
}
