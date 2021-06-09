import 'package:flutter/material.dart';
import 'package:ganna/apis/songs_api.dart';
import 'package:ganna/models/song_item.dart';
import 'package:ganna/models/songs.dart';
import 'package:ganna/widgets/song_card/SongCard.dart';
import 'package:ganna/widgets/song_player/SongPlayer.dart';

class SongScreen extends StatefulWidget {
  final SongItem songItem;

  const SongScreen({Key? key, required this.songItem}) : super(key: key);

  @override
  SongScreenState createState() => SongScreenState();
}

class SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {
    var img = widget.songItem.artworkUrl100 != null
        ? widget.songItem.artworkUrl100
        : '';

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(widget.songItem.trackName!),
              floating: true,
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.songItem.artistName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => SongPlayer(songItem: widget.songItem),
                childCount: 100,
              ),
            )
          ],
        ));
  }
}

//https://itunes.apple.com/search/?term=${term}
