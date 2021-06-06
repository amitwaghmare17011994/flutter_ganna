import 'package:flutter/material.dart';
import 'package:ganna/models/song_item.dart';

class SongCard extends StatefulWidget {
  final SongItem songItem;
  SongCard({Key? key, required this.songItem}) : super(key: key);

  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    SongItem songItem = widget.songItem;
    var artistName = songItem.artistName != null ? songItem.artistName : '';
    var songName = songItem.trackName != null ? songItem.trackName : '';
    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Ink.image(
                image: NetworkImage(songItem.artworkUrl100),
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
