import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';

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
              Ink.image(
                image: NetworkImage(img!),
                width: 900,
                height: 400,
                fit: BoxFit.fill,
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ));
  }
}
